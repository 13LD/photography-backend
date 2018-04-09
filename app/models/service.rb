class Service < ApplicationRecord
  validates :package_name, presence: true
  has_many :service_items
end
