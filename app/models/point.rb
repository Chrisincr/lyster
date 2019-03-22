class Point < ApplicationRecord
  belongs_to :match
  belongs_to :contender, class_name: "Combatant", foreign_key: "contender_id"
  belongs_to :challenger, class_name: "Combatant", foreign_key: "challenger_id"
end
