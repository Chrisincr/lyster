class User < ApplicationRecord
  has_secure_password
  has_many :points, through: :combatant, dependent: :destroy
end
