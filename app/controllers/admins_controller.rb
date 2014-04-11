class AdminsController < ApplicationController
  before_filter :check_owner, except: [:show, :edit]

  def index
    @admins = Admin.all
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      redirect_to admins_path, notice: "Admin created."
    else
      render 'new'
    end
  end

  def destroy
    @admin = Admin.find(params[:id])
    if @admin.owner == true
      redirect_to admins_path, notice: "Owner cannot be deleted."
    else
      @admin.destroy
      redirect_to admins_path, notice: "Admin deleted."
    end
  end

  private

  def admin_params
    params.require(:admin).permit(:username, :password, :password_confirmation, :owner)
  end
end
