FactoryGirl.define do
  factory :user, class: "User" do
    name "Coolio"
    email "coolio@coolio.com"
    password "password"
    password_confirmation "password"
  end
end
