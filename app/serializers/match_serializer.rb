class MatchSerializer < ActiveModel::Serializer
  attributes :id, :match_id, :season_id, :current_matchday, :status, :matchday, :winner, :home_score, :away_score, :halftime_away_score, :halftime_home_score, :overtime_home_score, :overtime_away_score, :penalties_home_score, :penalties_away_score, :home_team, :away_team

  def home_team 
    ActiveModel::SerializableResource.new(object.home_team, each_serializer: TeamSerializer)
  end
  def away_team 
    ActiveModel::SerializableResource.new(object.away_team, each_serializer: TeamSerializer)
  end


end 

