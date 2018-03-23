class AuthToken < ApplicationRecord
  validates :token, presence: true
  belongs_to :user
end
