class UsersController < ApplicationController
  before_action :authorize, except: %i[create update]

  # GET /users
  def index
    attrs = %w[id username]
    users = User.all.map { |user| user.attributes.slice(*attrs) }
    render json: users
  end

  # GET /users/1
  def show
    render json: @current_user
  end

  # POST /users
  def create
    @user = User.create!(user_params)
    session[:user_id] = @user.id
    render json: @user, status: :created
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params
      .require(:user)
      .permit(
        :username,
        :first_name,
        :last_name,
        :role,
        :team_id,
        :is_team_lead,
        :avatar,
        :password,
        :email
      )
  end
end
