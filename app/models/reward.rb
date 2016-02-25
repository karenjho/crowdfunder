class Reward < ActiveRecord::Base
  belongs_to :project
  has_many :pledges

  def self.dummy_attrs
    {
      threshold: 0,
      quantity: 9999,
      name: "Best reward ever!",
      description: "Our undying gratitude."
    }
  end

  def quantity_available?
    self.pledges.size < self.quantity
  end
end
