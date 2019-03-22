class CreatePoints < ActiveRecord::Migration[5.2]
  def change
    create_table :points do |t|
      t.integer :contender_id
      t.integer :challenger_id
      t.integer :contender_score
      t.integer :challenger_score

      t.timestamps
    end
    add_foreign_key :points, :combatants, column: :contender_id
    add_foreign_key :points, :combatants, column: :challenger_id
    add_index :points, :contender_id
    add_index :points, :challenger_id
  end
end
