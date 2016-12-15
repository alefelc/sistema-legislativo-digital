ActiveAdmin.register User do
  actions :index, :edit, :update
  permit_params :email, :admin

  config.filters = false

  menu :parent => "Usuarios"

  index title: 'Lista de usuarios' do
    id_column
    column :email
    column 'Nombre de usuario', :user do |i|
      "#{i.person.try(:full_name)}"
    end
    column 'Inicio de sesión actual', :current_sign_in_at
    column 'Contador inicios de sesión', :sign_in_count
    column 'Creado el', :created_at
    actions
  end

  form do |f|
    f.inputs "Edite usuario" do
      f.input :email
      f.input :admin
    end
    f.actions
  end

  controller do
    def update
      user_params = permitted_params[:user]
      if current_user.id == params[:id].to_i
        flash[:error] = "Únicamente otro usuario administrador puede realizar esta acción"
        redirect_to :back
        return
      end
      begin
        ActiveRecord::Base.transaction do
          @user = User.find(params[:id])
          @user.update_attribute(:admin, user_params[:admin])
        end
      rescue ActiveRecord::RecordInvalid
        false
      end

      if @user.persisted?
        flash[:success] = "Usuario actualizado correctamente"
        redirect_to :back
      else
        user_messages = @user.errors.full_messages.join(", ") if @user.present?
        flash.now[:error] = user_messages
        render :index
      end
    end
  end

end
