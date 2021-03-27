class SessionController < ApplicationController
  def login
  end

  def create
    user = User.find_by(email: params[:email])
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:notice] = "La connexion a échoué."
      render :login
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Vous avez été déconnecté."
  end
end
