FactoryGirl.define do
  factory :pledge, class: "Pledge" do
    amount { rand(100) }
  end

  factory :pledge_of_5, class: "Pledge" do
    amount 5
  end

  factory :pledge_of_50, class: "Pledge" do
    amount 50
  end

  factory :pledge_of_5000, class: "Pledge" do
    amount 5000
  end
end
