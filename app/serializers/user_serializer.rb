class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :first_name, :last_name, :role, :team_id, :is_team_lead, :avatar, :email, :updated_at
end
