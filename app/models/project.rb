class Project < ActiveRecord::Base
  has_many :rewards
  has_many :pledges, through: :rewards
  has_many :users, through: :pledges

  belongs_to :creator, class_name: "User"
end
