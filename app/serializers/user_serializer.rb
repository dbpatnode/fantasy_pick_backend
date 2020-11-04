class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :wins, :losses, :draws
end
