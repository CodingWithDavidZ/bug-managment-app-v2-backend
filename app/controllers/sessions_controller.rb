class SessionsController < ApplicationController
	before_action :authorize, except: %i[create destroy]

	def create
		user = User.find_by(username: params[:username])
		if user&.authenticate(params[:password])
			session[:user_id] = user.id
			render json: user
			# render json: {user: @user, token: (session)}, status: :created
		else
			render json: {
					errors: ['Invalid username or password'],
			       },
			       status: :unauthorized
		end
	end

	# /session
	def destroy
		session.delete :user_id
		head :no_content
	end
end
