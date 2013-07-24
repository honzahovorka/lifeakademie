# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "example#{n}@example.com" }
    name 'John'
    surname 'Doe'
    password 'secret_long'
    password_confirmation 'secret_long'

    factory :starlife_user do
      sequence(:email) { |n| "example#{n}@starlife.cz" }
    end
  end
end
