class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.string :player_name
      t.integer :team_id

    end
  end
end
