class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :description, presence: true
end
