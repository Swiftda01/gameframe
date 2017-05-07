class User < ApplicationRecord
  has_many :orders
  has_many :user_games
  has_many :games, through: :user_games
  has_many :game_genres, through: :games
  has_many :genres, through: :game_genres

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :date_of_birth, presence: true
  validate :verify_age

  private
  
  def verify_age
    unless self.date_of_birth.nil?
      if (self.date_of_birth.to_date + 16.years) > Date.today
        self.errors.add(:date_of_birth, "- You must be at least 16 years old to use this service")
      end
    end
  end
end
