class Bug < ApplicationRecord
    has_many :comments, -> { order(created_at: :asc) }
	belongs_to :project, optional: true
	belongs_to :user, foreign_key: :created_by
	belongs_to :user, foreign_key: :assigned_to

	enum status: ['Open', 'In Progress', 'Not A Bug', 'Not Reproducible', 'Missing Information', 'Pushed Back', 'Ready For Next Release', 'Ready For Retest', 'Fix Not Confirmed', 'Closed', 'Fixed', 'On Hold', 'Duplicate Bug']

	enum priority: ['Critical', 'Urgent', 'Medium', 'Low', 'Very Low']

	#create a method to change the date format of created_at and updated_at to be more readable and return the entire row
	# def make_date_format_more_readable
	# 	Bug.map do |bug|
	# 		bug.created_at = bug.created_at.strftime("%m/%d/%Y %H:%M")
	# 		bug.updated_at = bug.updated_at.strftime("%m/%d/%Y %H:%M")
	# 		but.target_resolution_date = bug.target_resolution_date.strftime("%m/%d/%Y %H:%M")
	# 	end
	# end

end
