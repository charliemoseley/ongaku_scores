class Score < ApplicationRecord
  belongs_to :user
  belongs_to :song

  has_one_attached :score_image
end
