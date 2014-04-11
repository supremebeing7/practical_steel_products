class AddOwnerToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :owner, :boolean
  end
end
