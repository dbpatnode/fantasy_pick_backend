class LeagueSerializer < ActiveModel::Serializer
  attributes :id, :league_name, :joins, :user_id
end
