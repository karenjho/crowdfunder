class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :pledges
  has_many :rewards, through: :pledges
  has_many :projects, through: :rewards

  has_many :created_projects, class_name: "Project", foreign_key: "creator_id"

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :password, length: {minimum: 5}, on: :create
  validates :password, confirmation: true, on: :create
  validates :password_confirmation, presence: true, on: :create

  Roles = [:admin, :project_owner, :default]

  def admin?
    self.role == 'admin'
  end

  def project_owner?
    self.created_projects.any?
  end



end
