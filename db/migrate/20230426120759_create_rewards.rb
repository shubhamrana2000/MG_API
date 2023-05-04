class CreateRewards < ActiveRecord::Migration[7.0]
  def change
    create_table :rewards do |t|
      t.string :Trans_name
      t.string :trans_type
      t.string :trans_logo

      t.timestamps
    end
  end
end
