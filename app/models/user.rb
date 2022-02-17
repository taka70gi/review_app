class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :image
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  has_many :comments
  has_many :favorites, dependent: :destroy
  has_many :likes, dependent: :destroy
  validates :name, presence: true
  validates :email,  length: { maximum: 50 }
end
