require_relative '../../../lib/constants/app_constants'

include AppConstants 

module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do |e|
      json_response({ message: e.message }, AppConstants::System::NOT_FOUND)
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      json_response({ message: e.message }, AppConstants::System::UNPROCESSABLE_ENTITY)
    end
  end
end
