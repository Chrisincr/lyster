class Tournament < ApplicationRecord
  belongs_to :user
  has_many :combatants
  has_many :rounds
end
