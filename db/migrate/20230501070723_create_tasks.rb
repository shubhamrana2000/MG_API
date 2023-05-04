class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :taskname
      t.string :taskimgurl
      t.string :taskamt
      t.string :taskval

      t.timestamps
    end
  end
end
