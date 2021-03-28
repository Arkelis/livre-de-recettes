class AccountsController < ApplicationController
  before_action :require_user_logged_in!

  def edit
    @user = Current.user
  end

  def update
    @user = Current.user
    user_params = get_user_params
    # check password
    unless @user.authenticate(user_params.delete(:current_password))
      flash[:notice] = "Le mot de passe est incorrect."
      return render :edit
    end
    # update user instance and save
    flash[:notice] = if @user.update(user_params) 
      then "La mise a jour du compte a réussi."
      else "La mise à jour du compte a échoué." end
    return render :edit
  end

  private

  def get_user_params
    params
      .require(:user)
      .permit(
        :current_password,
        :email,
        :password,
        :password_confirmation)
  end
end
