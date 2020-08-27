class Work < ApplicationRecord
  mount_uploader :photo, ImageUploader
end
