class RegistrationController < ApplicationController
  def register
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Compte créé avec succès !"
    else
      flash[:notice] = "L'inscription a échoué."
      render :register
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
