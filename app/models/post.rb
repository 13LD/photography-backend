class Post < ApplicationRecord
  attr_accessor :image

  mount_uploader :image, ImageUploader
  validates :description, presence: true
  has_many :comments

end
