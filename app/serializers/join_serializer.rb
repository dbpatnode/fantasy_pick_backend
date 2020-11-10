class JoinSerializer < ActiveModel::Serializer
  attributes :id , :user, :user_id, :league_id

  has_one :user
  # has_one :league
end
