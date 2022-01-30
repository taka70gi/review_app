class Drama < ApplicationRecord
  has_one_attached :image
  has_many :comments
  belongs_to :user, optional: true
  has_many :favorites, dependent: :destroy
  def favorited_by(user)
    favorites.where(user_id: user).exists?
  end
end
