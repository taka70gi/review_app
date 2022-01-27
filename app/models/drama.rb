class Drama < ApplicationRecord
  has_one_attached :image
  has_many :drama_comments
  has_many :comments, through: :drama_comments
end
