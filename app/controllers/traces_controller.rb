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
