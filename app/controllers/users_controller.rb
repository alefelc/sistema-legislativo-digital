class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new users_params
    if @user.save
      flash[:success] = t '.success'
      redirect_to user_path(@user.id)
    else
      flash.now[:error] = @user.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
  end

  private
  def users_params
  end
end
