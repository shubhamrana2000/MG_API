class CreateTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :teams do |t|
      t.string :team_name
      t.string :team_short_name
      t.string :team_logo

    end
  end
end
