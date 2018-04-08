class Service < ApplicationRecord
  validates :package_name, presence: true
end
