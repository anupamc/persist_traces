module Response
  def json_response(object, status, message = nil)
  	response_hash = { status: status, message: message, traces: object }
    response_hash.delete_if {|key, value| value.nil? }
    render json: response_hash.to_json
  end
end