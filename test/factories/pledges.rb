FactoryGirl.define do
  factory :pledge, class: "Pledge" do
    amount { rand(100) }
  end
end
