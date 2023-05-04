class CreateFantasies < ActiveRecord::Migration[7.0]
  def change
    create_table :fantasies do |t|
      t.string :Title
      t.string :Logo
      t.string :signupBonus
      t.string :Min_withdrawl
      t.string :WithdrawlType
      t.string :RefferalCode
      t.string :TaskLink

      t.timestamps
    end
  end
end
