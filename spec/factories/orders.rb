# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    after(:build) do |order|
      order.user = FactoryGirl.build(:user)
      order.course = FactoryGirl.build(:course)
    end
  end
end

