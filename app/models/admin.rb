class Admin < ActiveRecord::Base
  validates :username, :presence => true, :uniqueness => true

end