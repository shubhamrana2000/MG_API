class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.string :gamename
      t.string :gameurl
      t.string :gameimgurl
      t.string :gameamt

      t.timestamps
    end
  end
end
