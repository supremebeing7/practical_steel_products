class Product < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true
  validates :price, :description, :presence => true
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/system/products/images/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
