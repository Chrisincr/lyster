class CreateCombatants < ActiveRecord::Migration[5.2]
  def change
    create_table :combatants do |t|
      t.references :user, foreign_key: true
      t.references :tournament, foreign_key: true

      t.timestamps
    end
  end
end
