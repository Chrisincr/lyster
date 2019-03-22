class AddMatchtoPoints < ActiveRecord::Migration[5.2]
  def change
    add_reference :points, :match, index: true
  end
end
