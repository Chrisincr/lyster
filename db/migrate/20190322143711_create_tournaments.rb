class CreateTournaments < ActiveRecord::Migration[5.2]
  def change
    create_table :tournaments do |t|
      t.string :name
      t.references :user, foreign_key: true
      t.string :description
      t.date :start_date

      t.timestamps
    end
  end
end
