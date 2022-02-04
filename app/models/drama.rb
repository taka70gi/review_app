class Drama < ApplicationRecord
  has_one_attached :image
  has_many :comments
  belongs_to :user, optional: true
  has_many :favorites, dependent: :destroy
  def favorited_by(user)
    favorites.where(user_id: user).exists?
  end
  def self.search(keyword)
    where(["name LIKE? OR summary LIKE?", "%#{keyword}%", "%#{keyword}%"])
  end
  validates :name, presence:true, uniqueness: true
  validates :summary, presence:true
  validates :cast, presence:true
  validates :release_day, presence: true, numericality: true, length: {is:4}
  validates :image, presence:true
end
