class SessionsController < ApplicationController
  def new
  end

  def create
    admin = Admin.find_by_username(params[:username])
    if admin && admin.authenticate(params[:password])
      if params[:remember_me]
        cookies.permanent[:auth_token] = admin.auth_token
      else
        cookies[:auth_token] = admin.auth_token
      end
      redirect_to admins_path, notice: "Logged in."
    else
      flash.now.alert = "Wrong email or password, jerk"
      render 'new'
    end
  end

  def destroy
    cookies.delete(:auth_token)
    redirect_to root_path, notice: 'Logged out.'
  end
end
