class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :drama
  validates :user_id, uniqueness: { scope: :drama_id }
end
