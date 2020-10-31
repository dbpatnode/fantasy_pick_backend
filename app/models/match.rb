class Match < ApplicationRecord
    has_many :home_team, class_name: 'Team', foreign_key: :team_id, primary_key: :home_team_id
    has_many :away_team, class_name: 'Team', foreign_key: :team_id, primary_key: :away_team_id

   
end
