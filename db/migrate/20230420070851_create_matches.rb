class CreateMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :matches do |t|
      t.string :match_title
      t.string :match_short_title
      t.string :match_views
      t.string :match_status
      t.string :front_team
      t.string :opposite_team

    end
  end
end
