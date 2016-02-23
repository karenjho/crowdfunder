class Project < ActiveRecord::Base
  has_many :pledges
  has_many :users, through: :pledges

  belongs_to :creator, class_name: "User"
end
