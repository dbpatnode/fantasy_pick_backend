class LeagueSerializer < ActiveModel::Serializer
  attributes :id, :league_name, :join, :user


  def join
    ActiveModel::SerializableResource.new(object.joins, each_serializer: JoinSerializer)
  end

end
