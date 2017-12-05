require 'rails_helper'

RSpec.describe 'Trace API', type: :request do
	# initialize test data
	let!(:trace) { create_list(:trace, 10) }
	let(:trace_id) { trace.first.id }

	# Test suite for GET /traces/:id
	  describe 'GET /traces/:id' do
	    before { get "/traces/#{trace_id}" }

	    context 'when the record exists' do
	      it 'returns the trace' do
	        expect(json).not_to be_empty
	        expect(json['traces']['id']).to eq(trace_id)
	      end

	      it 'returns status code 200' do
	        expect(response).to have_http_status(200)
	      end
	    end

	    context 'when the record does not exist' do
	    	let(:trace_id) { 9999 }

	    	it 'returns status code 404' do
	    		expect(JSON.parse(response.body)['status']).to eq(404)
	    	end

	    	it 'returns a not found message' do
	    		expect(response.body).to match(/Couldn't find Trace/)
	    	end
	    end
	  end

  # Test suite for POST /traces
    describe 'POST /traces' do
      # valid payload
      let(:valid_attributes) { { latitude: 32.9377784729004, longitude: -117.230392456055 } }

      context 'when the request is valid' do
        before { post '/traces', params: valid_attributes }

        it 'creates a trace' do
          expect(json['traces']['latitude']).to eq("32.9377784729004")
        end

        it 'returns status code 200' do
          expect(response).to have_http_status(200)
        end

        it 'returns a success message' do
          expect(response.body).to match(/Successfully persisted traces./)
        end
      end

      context 'when the request is invalid' do
      	before { post '/traces', params: { latitude: 32.9377784729004 } }

      	it 'returns status code 422' do
      		expect(JSON.parse(response.body)['status']).to eq(422)
      	end

      	it 'returns a validation failure message' do
      		expect(response.body).to match(/Validation failed: Longitude can't be blank/)
      	end
      end
    end


    # Test suite for PUT /traces/:id
    describe 'PUT /traces/:id' do
      let(:valid_attributes) { { latitude: 32.9377784729004 } }

      context 'when the record exists' do
        before { put "/traces/#{trace_id}", params: valid_attributes }

        it 'updates the record' do
          expect(response.body).to match(/Successfully updated traces./)
        end

        it 'returns status code 200' do
          expect(response).to have_http_status(200)
        end
      end
    end


    # Test suite for DELETE /traces/:id
    describe 'DELETE /traces/:id' do
      before { delete "/traces/#{trace_id}" }

      it 'deletes the record' do
        expect(response.body).to match(/Successfully deleted traces./)
      end

      it 'returns status code 200' do
        expect(JSON.parse(response.body)['status']).to eq(200)
      end
    end
end