class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|

      t.integer :team_id
      t.string :team_name
      t.string :crest
      t.string :website
      t.integer :founding_year
      t.string :club_colors

      t.timestamps
    end
  end
end
