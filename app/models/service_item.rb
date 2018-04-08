class ServiceItem < ApplicationRecord
  validates :description, presence: true
  belongs_to :service
end
