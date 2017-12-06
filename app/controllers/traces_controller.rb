require 'haversine'

class TracesController < ApplicationController
	before_action :set_trace, only: [:show, :update, :destroy]

	# POST /traces
	def create
		@statuses = []
  	if params["_json"]
	  	params["_json"].each do |trace_params|
	  		params.permit!
	  		@trace = Trace.create!(trace_params)
	  		@statuses << @trace
	  		if @trace.valid?
	  			@status = 200
	  			@message = 'Successfully persisted traces.'
	  		end
	  	end
	  	json_response(@statuses, @status, @message)
	  else
	  	@trace = Trace.create!(trace_params)
	  	if @trace.valid?
	  		json_response(@trace, 200, 'Successfully persisted traces.')
	  	end
	  end
  end

  # GET /traces/:id
  def show
  	if @trace.present?
  		json_response(@trace, 200)
  	else
  		json_response(@trace, 404)
  	end
  end

  # GET /traces/show_all
  def show_all
  	@trace_all = Trace.all
  	@merged_traces = []
  	@merged_traces << {"latitude" => @trace_all.first.latitude, "longitude" => @trace_all.first.longitude, "distance" => 0}
  	@trace_all.each_with_index do |trace, index|
  		break if index.eql?(@trace_all.count - 1)
  		trace_distance = Haversine.distance(@trace_all[index].latitude, @trace_all[index].longitude, 
  											@trace_all[index+1].latitude, @trace_all[index+1].longitude).to_miles
  		morphed_trace = @trace_all[index+1].attributes.merge!("distance" => @merged_traces[index]['distance'] + trace_distance)
  		@merged_traces << {"latitude" => morphed_trace['latitude'], "longitude" => morphed_trace['longitude'], "distance" => morphed_trace['distance']}
  	end
  	json_response(@merged_traces, 200)
  end

  # PUT /traces/:id
  def update
  	@trace.update(trace_params)
  	json_response(@trace, 200, 'Successfully updated traces.')
  end

  # DELETE /traces/:id
  def destroy
  	@trace.destroy
  	json_response(@trace, 200, 'Successfully deleted traces.')
  end

  private

	  def trace_params
		  # whitelist params
		  params.permit(:latitude, :longitude)
		end

		def set_trace
			@trace = Trace.find(params[:id])
		end  
end
