class Admin < ActiveRecord::Base
  has_secure_password
  validates :username, :presence => true, :uniqueness => true
  validates :password_digest, presence: true

  before_create { generate_token(:auth_token) }

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while Admin.exists?(column => self[column])
  end
end
