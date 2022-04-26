class Comment < ApplicationRecord
  belongs_to :bug, optional: true
  belongs_to :user, foreign_key: :created_by
end
