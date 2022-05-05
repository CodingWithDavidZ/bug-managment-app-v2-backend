class BugsController < ApplicationController
	before_action :set_bug, only: %i[show update destroy]
	before_action :authorize, except: %i[update index sortOrder]
  
	# '/bugs/sortOrder'
	def sortOrder
    sortDirection = params[:sortDirection]
		sortFilter = params[:sortFilter]
		if sortDirection == 'Descending'
			render json: Bug.sort_order(sortFilter).order(created_at: :desc)
		elsif sortDirection == 'Ascending'
			render json: Bug.sort_order(sortFilter).order(created_at: :asc)
		else
			render json: Bug.sort_order(sortFilter)
		end
	end
  
  # GET /bugs
  def index
    @bugs = Bug.all
    render json: @bugs.order(created_at: :desc)
  end
	# GET /bugs/1
	def show
		render json: @bug
	end

	# POST /bugs
	def create
		@bug = Bug.new(bug_params)
		@bug.update(created_by: @current_user.id)
		if @bug.save
			if sortDirection == 'Descending'
				render json: Bug.sort_order(sortFilter).order(created_at: :desc)
			
			elsif sortDirection == 'Ascending'
				render json: Bug.sort_order(sortFilter).order(created_at: :asc)
			
			end
		else
			render json: @bug.errors, status: :unprocessable_entity
		end
	end

	

	# PATCH/PUT /bugs/1
	def update
		if @bug.update(bug_params)
			render json: @bug
		else
			render json: @bug.errors, status: :unprocessable_entity
		end
	end

	# DELETE /bugs/1
	def destroy
		@bug.destroy
	end

	private

	# Use callbacks to share common setup or constraints between actions.
	def set_bug
		@bug = Bug.find(params[:id])
	end

	# Only allow a list of trusted parameters through.
	def bug_params
		params
			.require(:bug)
			.permit(
				:issue_title,
				:issue_description,
				:identified_by,
				:identified_date,
				:project_id,
				:assigned_to,
				:status,
				:status_modified_date,
				:priority,
				:target_resolution_date,
				:progress,
				:actual_resolution_date,
				:resolution_summary,
				:modified_by,
				:approved_by,
				:image_url,
				:approved,
				:comment_id,
				:created_by,
				:sortBy,
			)
	end
end
