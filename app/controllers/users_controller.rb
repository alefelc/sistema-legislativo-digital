class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    authorize :configurations, :all?
    @users = User.all
  end

  def new
    authorize :configurations, :all?
    @user = User.new
  end

  def create
    authorize :configurations, :all?
    @user = User.new users_params
    if @user.save
      flash.now[:success] = t '.success'
      redirect_to edit_user_path @user.id
    else
      flash.now[:error] = @user.errors.full_messages
      redirect_to new_user_path
    end
  end

  def edit
    authorize :configurations, :all?
    @user = User.find params[:id]
  end

  def update
    authorize :configurations, :all?
    @user = User.find params[:id]
    if @user.update user_update_params
      flash[:success] = t '.success'
      redirect_to users_path
    else
      flash[:error] = @user.errors.full_messages
      redirect_to edit_user_path(@user)
    end
  end

  private

  def users_params
    params.require(:user).permit :person_id, :email, :password,
                                 :password_confirmation, role_ids: []
  end

  def users_params_no_pass
    params.require(:user).permit :person_id, :email, role_ids: []
  end

  def user_update_params
    if params[:user][:password].empty?
      users_params_no_pass
    else
      users_params
    end
  end
end
