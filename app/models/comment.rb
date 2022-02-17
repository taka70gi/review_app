class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :drama
  has_many :likes, dependent: :destroy

  validates :content, presence: true

  def liked_by(user)
    likes.where(user_id: user).exists?
  end
end
