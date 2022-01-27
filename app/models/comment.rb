class Comment < ApplicationRecord
  belongs_to :user
  has_many :drama_comments
  has_many :dramas, through: :drama_comments
  accepts_nested_attributes_for :drama_comments
end
