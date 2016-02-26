# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create()

100.times do
  Project.create({
    name: Faker::Company.catch_phrase,
    description: "#{Faker::Company.bs} from #{Faker::Company.name} #{Faker::Company.suffix}",
    goal: rand(1000),
    end_date: Faker::Date.between(100.year.ago, Date.today + 50),
    start_date: Faker::Date.between(100.year.ago, Date.today + 50),
    creator_id: 1,
    category_id: rand(8)
    }
  )
end
