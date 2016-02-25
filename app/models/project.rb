class Project < ActiveRecord::Base
  has_many :rewards
  has_many :pledges, through: :rewards
  has_many :users, through: :pledges

  belongs_to :creator, class_name: "User"
  belongs_to :category

  accepts_nested_attributes_for :rewards, reject_if: :all_blank, allow_destroy: true

  validates :name, :description, presence:true
  validates :goal, numericality: {only_integer: true}
  validates :end_date, presence:true


  def goal_achieved?
    self.goal - pledges_total <= 0
  end

  def pledges_total
    self.pledges.sum(:amount)
  end
  
  def percent_achieved
    percent = pledges_total.to_f * 100 / self.goal.to_f
    percent.round(2)
  end
end
