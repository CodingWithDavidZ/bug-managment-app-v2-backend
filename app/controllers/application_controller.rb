class ApplicationController < ActionController::API
include ActionController::Cookies
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
	before_action :authorize


	private

	def authorize
		@current_user = User.find(session[:user_id])
		if @current_user
			render json: @current_user
		else
			render json: { errors: ['Not Authorized'] }, status: :unauthorized
		end
	end

	def render_unprocessable_entity(exceptions)
		render json: {
				errors: exceptions.record.errors.full_messages,
		       },
		       status: :unprocessable_entity
	end


end
