class Tournament < ApplicationRecord
  belongs_to :user
  has_many :combatants, dependent: :destroy
  has_many :rounds, dependent: :destroy
end
