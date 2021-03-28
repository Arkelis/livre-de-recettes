class RecoveryController < ApplicationController
  def recover
  end

  def send_recover_token
    @user = User.find_by(email: params[:email])

    if @user.present?
      PasswordMailer.with(user: @user).reset.deliver_now
    end

    redirect_to root_path, notice: "Un email vous a été envoyé si un compte est associé à cette adresse email."
  end

  def reset
    @user = User.find_signed!(params[:token], purpose: "password_reset")
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    redirect_to login_path, notice: "Le lien a expiré. Veuillez réessayer."
  end

  def update_password
    @user = User.find_signed!(params[:token], purpose: "password_reset")
    if @user.update(password_params)
      redirect_to login_path, notice: "Mot de passe réinitialisé avec succès."
    else
      render :reset
    end
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
