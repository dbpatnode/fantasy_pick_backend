class JoinSerializer < ActiveModel::Serializer
  attributes :id
  has_one :user
  has_one :league
end