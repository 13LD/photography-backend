class Post < ApplicationRecord
  attr_accessor :image

  mount_uploader :image, ImageUploader
  validates :description, presence: true
  validate :image_size_validation

  def image_size_validation
    if image? && image.size > 10.megabytes
      errors.add("Image should be less than 10MB")
    end
  end

end
