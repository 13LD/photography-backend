class Photo < ApplicationRecord
  attr_accessor :file

  mount_uploader :file, PhotoUploader
  belongs_to :tag
end
