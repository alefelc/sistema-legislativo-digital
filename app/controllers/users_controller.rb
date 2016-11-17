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
  end

  def update
    authorize :configurations, :all?
  end

  private

  def users_params
    params.require(:user).permit :person_id, :email, :password,
                                 :password_confirmation, role_ids: []
  end
end
