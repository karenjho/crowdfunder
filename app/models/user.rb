class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :pledges
  has_many :created_projects, class_name: "Project", foreign_key: "creator_id"

end
