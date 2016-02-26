FactoryGirl.define do
  factory :reward, class: "Reward" do
    threshold { rand(50) }
    quantity { rand(20) }
  end

  factory :reward_with_2000_threshold, class: "Reward" do
    threshold 2000
    quantity 100
  end

  factory :reward_with_10_threshold, class: "Reward" do
    threshold 10
    quantity 500
  end
end
