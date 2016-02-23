class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :pledges
  has_many :created_projects, class_name: "Project", foreign_key: "creator_id"

  validates :password, length: {minimum: 5}
  validates :passsword, confirmation: true
  validates :password_confirmation, presence: true
end
