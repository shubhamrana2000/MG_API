class CreateUserprofiles < ActiveRecord::Migration[7.0]
  def change
    create_table :userprofiles do |t|
      t.string :user_id
      t.string :userEmail
      t.string :userName
      t.string :phoneNumber
      t.string :DOB
      t.string :Gender
      t.string :profilePic
      t.string :Occupation
      t.string :Address

      t.timestamps
    end
  end
end
