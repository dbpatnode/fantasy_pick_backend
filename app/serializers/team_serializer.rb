class TeamSerializer < ActiveModel::Serializer
  attributes :id, :team_id, :team_name, :crest, :website,:founding_year, :club_colors

end
