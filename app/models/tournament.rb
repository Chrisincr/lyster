class Tournament < ApplicationRecord
  validates :name, presence: true, length: { in: 2..20 }

  belongs_to :user
  has_many :combatants, dependent: :destroy
  has_many :rounds, dependent: :destroy
end
