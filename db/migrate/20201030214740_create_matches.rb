class CreateMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :matches do |t|
      t.string :home_team_name
      t.integer :home_team_id
      t.string :away_team_name
      t.integer :away_team_id
      t.integer :match_id
      t.integer :season_id
      t.integer :current_matchday
      t.string :status
      t.integer :matchday
      t.string :winner
      t.integer :home_score
      t.integer :away_score
      t.integer :halftime_home_score
      t.integer :halftime_away_score
      t.integer :overtime_home_score
      t.integer :overtime_away_score
      t.integer :penalties_home_score
      t.integer :penalties_away_score

      t.timestamps
    end
  end
end


