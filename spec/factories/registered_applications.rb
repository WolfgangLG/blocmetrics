FactoryGirl.define do
  nm = Faker::App.name
  factory :registered_application do
    name nm
    url "www.#{nm.gsub(" ","").downcase}.com"
    association :user_id, factory: :user, strategy: :build
  end
end
