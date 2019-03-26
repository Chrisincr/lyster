class User < ApplicationRecord
  has_secure_password
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :name, presence: true, length: { in: 2..20 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }

  has_many :combatants, dependent: :destroy
  has_many :points_as_contender, through: :combatants, :source => :points_as_contender
  has_many :points_as_challenger, through: :combatants, :source => :points_as_challenger
  
  
end
