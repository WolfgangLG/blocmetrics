FactoryGirl.define do
  pw = "password"
  factory :user do
    email "blahblah@blocmetrics.com"
    password pw
    password_confirmation pw
    confirmed_at Date.today
  end
end
