class Tag < ApplicationRecord
  validate :tag_name, presence: true
end
