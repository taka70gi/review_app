class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :drama

  validates :content, presence: true
end
