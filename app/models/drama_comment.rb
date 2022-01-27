class DramaComment < ApplicationRecord
  belongs_to :drama
  belongs_to :comment
end
