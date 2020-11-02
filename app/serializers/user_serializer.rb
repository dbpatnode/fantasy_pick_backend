class UserSerializer < ActiveModel::Serializer
  attributes :id, :password, :password_digest, :username, :email, :wins, :losses, :draws
end
