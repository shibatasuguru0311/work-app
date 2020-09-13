class User < ApplicationRecord
  mount_uploader :image, ImageUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :messages, dependent: :destroy
         has_many :entries, dependent: :destroy
         has_many :works, dependent: :destroy, foreign_key: :work_user_id
  
  acts_as_followable
  acts_as_follower
       
validates :name, presence: true, length: { maximum: 10 } 
validates :email, presence: true, uniqueness: true
validates :image, presence: true
validates :profile, presence: true, length: { maximum: 200 } 

end