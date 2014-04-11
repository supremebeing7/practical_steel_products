class AdminsController < ApplicationController
  def index
    @admins = Admin.all
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      redirect_to root_path, notice: "Admin created"
    else
      render 'new'
    end
  end

  private

  def admin_params
    params.require(:admin).permit(:username, :password, :password_confirmation)
  end
end
