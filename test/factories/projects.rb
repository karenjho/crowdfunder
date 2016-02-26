FactoryGirl.define do
  factory :project, class: "Project" do
    name "Slip n Slide"
    description "Only the most fun backyard game in the world!"
    goal 10000
    start_date Time.now
    end_date Time.now.advance(months: 6)
  end

  factory :project_low_goal, class: "Project" do
    name "Low Goal"
    description "One hundred dollars ain't much. Spare some change?"
    goal 100
    start_date Time.now
    end_date Time.now.advance(months: 6)
  end

end
