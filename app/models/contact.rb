class Contact < ApplicationRecord
  validates :email, presence: true
  validates :phone1, presence: true
end
