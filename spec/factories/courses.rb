# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :curse do
    name "Super kurz"
    start_at DateTime.now
    program "Super uber program"
    note "It'll be great"
    city "Awesome city of Prague"
    price 8500
  end
end


