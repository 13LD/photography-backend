class Post < ApplicationRecord
  attr_accessor :image

  mount_uploader :image, ImageUploader
  validates :description, presence: true


end
