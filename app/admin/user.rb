ActiveAdmin.register User do
  menu label: 'Usuarios'

  index do
    id_column
    column :email
    column :last_sign_in_at
    column :last_sign_in_ip
    column :created_at
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row 'Email', :email
      row 'Ingreso actual a las', :current_sign_in_at
      row 'Ultimo ingreso a las', :last_sign_in_at
      row 'Dirección IP actual ingreso', :current_sign_in_ip
      row 'Dirección IP último ingreso', :last_sign_in_ip
      row 'Creado el', :created_at
      row 'Actualizado el', :updated_at
    end
  end

  # show do
  #   attributes_table do
  #     row :name
  #     row :city
  #     row :state
  #     row :cp
  #     row :address
  #     row :phone
  #     row :cell_phone
  #     row :email
  #     row :secondary_email
  #     row :logo
  #     row :code
  #     row :cue
  #     row :cuit
  #     row :profiles do
  #       institution.profiles.map{ |p| "#{p.name} #{p.surname}" }.join(',')
  #     end
  #   end
  # end

  # index do
  #   selectable_column
  #   id_column
  #   column :name
  #   column :city do |i|
  #     "#{i.city}, #{i.state} (#{i.cp})"
  #   end
  #   column :address
  #   column :phone
  #   column :cell_phone
  #   column :email
  #   column :secondary_email
  #   column :code
  #   column :cue
  #   column :cuit
  #   actions
  # end

  # form(html: { multipart: true }) do |f|
  #   f.inputs 'Institution' do
  #     f.input :name
  #     f.input :city
  #     f.input :state
  #     f.input :cp
  #     f.input :address
  #     f.input :phone
  #     f.input :cell_phone
  #     f.input :email
  #     f.input :secondary_email
  #     if institution.logo.present?
  #       f.input :logo, as: :file, hint: image_tag(institution.logo, style: 'max-width: 100px; max-height: 100px;')
  #     else
  #       f.input :logo, as: :file
  #     end
  #     f.input :code
  #     f.input :cue
  #     f.input :cuit
  #   end
  #   f.actions
  # end

  # filter :name
  # filter :city
  # filter :state
  # filter :cp
  # filter :address
  # filter :phone
  # filter :cell_phone
  # filter :email
  # filter :secondary_email
  # filter :code
  # filter :cue
  # filter :cuit
end
