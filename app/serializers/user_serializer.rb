class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :wins, :losses, :draws, :joined_leagues, :picks, :uuid
  
  def picks 
    ActiveModel::SerializableResource.new(object.picks, each_serializer: PickSerializer)
  end
end