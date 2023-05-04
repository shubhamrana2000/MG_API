class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.integer :user_id
      t.integer :coins
      t.string :referral_code

      t.timestamps
    end
  end
end
