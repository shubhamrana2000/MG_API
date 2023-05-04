class AddAmountToRewards < ActiveRecord::Migration[7.0]
  def change
    add_column :rewards, :coins_amount, :string
    add_column :rewards, :conversion_amount, :string
  end
end
