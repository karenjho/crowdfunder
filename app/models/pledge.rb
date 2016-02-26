class Pledge < ActiveRecord::Base
  belongs_to :user
  belongs_to :reward
  has_one :project, through: :reward

  def adequate_amount?(reward)
    self.amount >= reward.threshold
  end

end
