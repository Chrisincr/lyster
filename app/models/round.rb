class Round < ApplicationRecord
  belongs_to :tournemant
  has_many :matches
end
