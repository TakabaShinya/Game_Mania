class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.name = "ゲスト"
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed at = Time.now
    end
  end
  has_many :games, dependent: :destroy
  has_many :game_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  validates :name, length: {in: 2..20}
  validates :introduction, length: {maximum: 50}
end
