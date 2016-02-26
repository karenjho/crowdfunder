FactoryGirl.define do
  factory :reward do
    threshold { rand(50) }
    quantity { rand(20) }
  end
end
