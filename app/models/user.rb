class User < ApplicationRecord
  has_secure_password
  has_many :bugs
  belongs_to :team, optional: true
  has_many :projects, through: :teams
  has_many :comments, foreign_key: :created_by
  validates :first_name, :last_name, presence: true
  validates :username, uniqueness: true, presence: true
  validates :email,
            format: {
              with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
              message: 'Email invalid'
            },
            uniqueness: {
              case_sensitive: false
            },
            length: {
              minimum: 4,
              maximum: 254
            },
            presence: true
end
