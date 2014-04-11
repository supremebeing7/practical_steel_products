class InitialTables < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.text :description
      t.attachment :image
      t.timestamps
    end

    create_table :admins do |t|
      t.string :username
      t.string :password_digest
    end
  end
end
