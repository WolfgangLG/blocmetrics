FactoryGirl.define do
  factory :registered_application do
    user
    name { Faker::App.name }
    url  {"www.#{name}.com"}
  end
end
