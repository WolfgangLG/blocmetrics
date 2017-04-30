FactoryGirl.define do
    pw = Faker::Lorem.characters(10)
  factory :user do
    name Faker::Name.name
    sequence(:email){|n| "user#{n}@blocmetrics.com" }
    password pw
    password_confirmation pw
    confirmed_at Date.today
  end
end
