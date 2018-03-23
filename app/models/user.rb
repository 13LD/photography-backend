class User < ApplicationRecord
  has_secure_password
  validates_uniqueness_of :email
  validates_email_format_of :email, :message => 'is not looking good'
  validates :name, presence: true
  has_one :auth_token
end
