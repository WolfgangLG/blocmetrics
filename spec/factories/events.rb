FactoryGirl.define do
  nm = Faker::App.name
  factory :event do
    sequence(:name) { |n| "#{nm} Event ##{n}" }
    association :registered_application_id, factory: :registered_application, strategy: :build
  end
end
