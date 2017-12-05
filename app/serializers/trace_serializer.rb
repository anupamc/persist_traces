class TraceSerializer < ActiveModel::Serializer
	cache key: 'trace'
  attributes :id, :latitude, :longitude
end
