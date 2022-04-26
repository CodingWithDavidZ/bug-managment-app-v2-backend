class Project < ApplicationRecord
  has_many :bugs
  belongs_to :team
end
