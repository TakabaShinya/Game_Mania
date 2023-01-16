class Game < ApplicationRecord
  attachment :game_image
  belongs_to :user
  validates :title, presence: true
  validates :hard, presence: true
  validates :body, presence: true
end
