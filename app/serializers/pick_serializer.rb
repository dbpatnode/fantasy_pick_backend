class PickSerializer < ActiveModel::Serializer
  attributes :id, :winner, :match, :match_day, :user, :homeTeam, :awayTeam
  # has_one :user
  # has_one :match


end
