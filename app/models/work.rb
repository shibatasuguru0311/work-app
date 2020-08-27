class Work < ApplicationRecord
  mount_uploader :photo, ImageUploader
  belongs_to :entry, class_name: 'User', :foreign_key => 'entry'
end
