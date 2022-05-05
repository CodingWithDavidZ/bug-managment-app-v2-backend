class BugsController < ApplicationController
	before_action :set_bug, only: %i[show update destroy]
	before_action :authorize, except: %i[update index sortOrder]
  
  

  
  @@lastSortDirection = 'Descending'
  @@lastSortFilter = 'all'
 
  def self.lastSortDirection
    @@lastSortDirection
  end

  def self.lastSortFilter
    @@lastSortFilter
  end
  
	# '/bugs/sortOrder'
	def sortOrder
    sortDirection = params[:sortDirection]
		sortFilter = params[:sortFilter]
    @@lastSortDirection = params[:sortDirection]
    @@lastSortFilter = params[:sortFilter]
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
		# sortDirection = @@classSortDirection
		# sortFilter = @@classSortFilter
		if @bug.save
			if sortDirection == 'Descending'
				render json: Bug.sort_order(sortFilter).order(created_at: :desc)
				# @@classSortFilter = sortFilter
			elsif sortDirection == 'Ascending'
				render json: Bug.sort_order(sortFilter).order(created_at: :asc)
				# @@classSortFilter = sortFilter
			end
		else
			render json: @bug.errors, status: :unprocessable_entity
		end
	end

	# bug_id = params[:bug_id]
	#   comment_text = params[:comment_text]
	#   user_id = @current_user.id
	#   comment =
	#     Comment.new(
	#       bug_id: bug_id,
	#       comment_text: comment_text,
	#       created_by: user_id
	#     )
	#   if comment.save
	#     render json: comment, status: :created
	#   else
	#     render json: comment.errors, status: :unprocessable_entity
	#   end

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
