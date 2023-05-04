class CreatePointsHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :points_histories do |t|
      t.integer :A_coins
      t.string :account_id
      t.string :Add_type_logo
      t.string :Scheme_Name

      t.timestamps
    end
  end
end
