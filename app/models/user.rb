class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :pledges
  has_many :rewards, through: :pledges
  has_many :projects, through: :rewards

  has_many :created_projects, class_name: "Project", foreign_key: "creator_id"

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :password, length: {minimum: 5}
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  Roles = [:admin, :project_owner, :default]
end
