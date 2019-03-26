class User < ApplicationRecord
  has_secure_password
  has_many :combatants, dependent: :destroy
  has_many :points_as_contender, through: :combatants, :source => :points_as_contender
  has_many :points_as_challenger, through: :combatants, :source => :points_as_challenger
  
  
end
