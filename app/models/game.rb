class Game < ApplicationRecord
  attachment :game_image
  belongs_to :user
  has_many :game_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
  validates :title, presence: true
  validates :hard, presence: true
  validates :body, presence: true
end
