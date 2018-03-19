class ProfileController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def edit
  end

  def update
    if @user.update user_params
      flash[:success] = 'Actualizaste tu información correctamente.'
      redirect_to dashboard_path
    else
      flash[:error] = @user.errors.full_messages
      render :edit
    end
  end

  private

  def user_params_with_passw
    params.require(:user).permit(:password, :password_confirmation, person_attributes: [:name, :surname, :cuit_or_dni, :phone, :address, :email, :position])
  end

  def user_params_without_passw
    params.require(:user).permit(person_attributes: [:name, :surname, :cuit_or_dni, :phone, :address, :email, :position])
  end

  def user_params
    if params[:user][:password].blank?
      puts "*"*88
      puts "Entre por true"
      user_params_without_passw
    else
      puts "*"*88
      puts "Entre por false"
      user_params_with_passw
    end
  end

  def set_user
    @user = current_user
  end
end
