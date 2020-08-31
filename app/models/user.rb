class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :messages, dependent: :destroy
         has_many :entries, dependent: :destroy
       


validates :name, presence: true, uniqueness: true, length: { maximum: 10 } 
validates :email, presence: true, uniqueness: true
validates :image, presence: true
end