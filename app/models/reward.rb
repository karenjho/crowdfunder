class Reward < ActiveRecord::Base
  belongs_to :project
  has_many :pledge
  has_many :users, through: :pledge
end
