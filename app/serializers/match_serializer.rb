class MatchSerializer < ActiveModel::Serializer
  attributes :id, :home_team_name, :home_team_id, :away_team_name, :away_team_id, :match_id, :season_id, :current_matchday, :status, :matchday, :winner, :home_score, :away_score, :halftime_away_score, :halftime_home_score, :overtime_home_score, :overtime_away_score, :penalties_home_score, :penalties_away_score
end 

