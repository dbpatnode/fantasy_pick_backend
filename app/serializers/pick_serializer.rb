class PickSerializer < ActiveModel::Serializer
  attributes :id, :winner
  has_one :user
  has_one :match
end
