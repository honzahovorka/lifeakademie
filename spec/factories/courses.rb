# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :course do
    name "Super kurz"
    start_date DateTime.now
    program "Super uber program"
    note "It'll be great"
    city "Awesome city of Prague"
    price 8500
  end
end


