class Pledge < ActiveRecord::Base
  belongs_to :user
  belongs_to :reward

  def adequate_amount?
    self.amount >= reward.threshold
  end

end
