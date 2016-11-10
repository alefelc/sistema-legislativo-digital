class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
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
  end

  def update
  end

  private

  def users_params
    params.require(:user).permit :person_id, :email, :password,
                                 :password_confirmation, role_ids: []
  end
end
