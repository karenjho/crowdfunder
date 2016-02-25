class Pledge < ActiveRecord::Base
  belongs_to :user
  belongs_to :reward

  def adequate_amount?
    self.amount >= reward.threshold
  end

  def quantity_available?
    self.pledges.size < self.quantity
  end

end
