class Combatant < ApplicationRecord
  belongs_to :user
  belongs_to :tournament
  has_many :points_as_contender, class_name: "Point", foreign_key: "contender_id", dependent: :destroy
  has_many :points_as_challenger, class_name: "Point", foreign_key: "challenger_id", dependent: :destroy
  def points
    Point.where("contender_id = ? OR challenger_id = ?", self.id, self.id)
  end
end
