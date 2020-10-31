class Team < ApplicationRecord
    has_many :home_matches, class_name: 'Match', foreign_key: :home_team_id, primary_key: :team_id
    has_many :away_matches, class_name: 'Match', foreign_key: :away_team_id, primary_key: :team_id

end

