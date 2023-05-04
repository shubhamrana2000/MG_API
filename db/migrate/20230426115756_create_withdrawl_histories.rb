class CreateWithdrawlHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :withdrawl_histories do |t|
      t.integer :account_id
      t.integer :w_coins
      t.string :Trans_type_logo
      t.string :Transaction_ID
      t.string :transaction_type

      t.timestamps
    end
  end
end
