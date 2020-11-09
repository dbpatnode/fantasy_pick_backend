class PickSerializer < ActiveModel::Serializer
  attributes :id, :winner, :match, :match_day, :user
  # has_one :user
  # has_one :match


end
