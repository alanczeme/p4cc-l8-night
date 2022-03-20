class ApplicationController < ActionController::API
  include ActionController::Cookies

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_message

  private

  def record_not_found_message(error)
    render json: {error: "#{error.model} not found"}, status: :not_found
  end

end
