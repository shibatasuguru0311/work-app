class Work < ApplicationRecord
  mount_uploader :photo, ImageUploader
  belongs_to:user

validates :name, presence: true, length: { maximum: 30 } 
validates :introduction, presence: true,length: { maximum: 200 } 
validates :photo, presence: true
validates :address, presence: true
end
