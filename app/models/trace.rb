class Trace < ApplicationRecord
	validates_presence_of :latitude, :longitude
end
