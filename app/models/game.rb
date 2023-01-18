class Game < ApplicationRecord
  attachment :game_image
  belongs_to :user
  has_many :game_comments, dependent: :destroy
  validates :title, presence: true
  validates :hard, presence: true
  validates :body, presence: true
end
