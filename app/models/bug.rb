class Bug < ApplicationRecord
    has_many :comments, -> { order(created_at: :asc) }
	belongs_to :project, optional: true
	belongs_to :user, foreign_key: :created_by
	belongs_to :user, foreign_key: :assigned_to

	enum status: ['Open', 'In Progress', 'Not A Bug', 'Not Reproducible', 'Missing Information', 'Pushed Back', 'Ready For Next Release', 'Ready For Retest', 'Fix Not Confirmed', 'Closed', 'Fixed', 'On Hold', 'Duplicate Bug']

	enum priority: ['Critical', 'Urgent', 'Medium', 'Low', 'Very Low']

	def self.sort_order(sortFilter)
		open = ['Open', 'In Progress']
		completed = ['Closed', 'Fixed', 'Duplicate Bug', 'Not Reproducible', 'Not a Bug', 'Ready For Next Release']
		needs_approval = ['Fix Not Confirmed', 'Ready For Retest']
		waiting = ['Missing Information', 'Pushed Back', 'On Hold', 'Ready For Retest']

		# Maybe just do the filter here and handle order in the controller

		if sortFilter == 'all'
				return Bug.all
		elsif sortFilter == 'inProgress'
				return Bug.where(:status => open)
		elsif sortFilter == 'waiting'
				return Bug.where(:status => waiting)
		elsif sortFilter == 'needsApproval'
				return Bug.where(:status => needs_approval)
		elsif sortFilter == 'completed'			
				return Bug.where(:status => completed)	
		else 
			return @bug.errors.full_messages, status: :unprocessable_entity
		end
	end
end
