class ProjectSerializer < ActiveModel::Serializer
  attributes :id,
             :project_name,
             :start_date,
             :target_end_date,
             :actual_end_date,
             :created_by,
             :modified_by,
             :bug_id,
             :team_id,
             :created_at,
             :updated_at
end
