# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    after(:build) do |order|
      order.user ||= FactoryGirl.build(:order)
      order.course ||= FactoryGirl.build(:curse)
    end
  end
end

