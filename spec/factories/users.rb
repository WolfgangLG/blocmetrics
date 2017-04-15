FactoryGirl.define do
  pw = Faker::Lorem.characters(7)
  factory :user do
    email { Faker::Internet.email }
    password pw
    password_confirmation pw
    confirmed_at Date.today
  end
end
