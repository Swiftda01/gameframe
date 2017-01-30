class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :date_of_birth, presence: true
  validate :varify_age

  private
  def varify_age
    unless self.date_of_birth.nil?
      if (self.date_of_birth.to_date + 16.years) > Date.today
        self.errors.add(:date_of_birth, "- You must be at least 16 years old to use this service")
      end
    end
  end
end
