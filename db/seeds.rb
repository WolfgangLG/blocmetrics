5.times do
  User.create!(
    email:        Faker::Internet.email,
    password:     Faker::Lorem.characters(7)
  )
end
users = User.all

# Create Topics
10.times do
  name = Faker::App.name
  RegisteredApplication.create!(
    user:  users.sample,
    name:  name,
    url:   "www.#{name}.com"
  )
end
registered_applications = RegisteredApplication.all

puts "#{User.count} users created"
puts "#{RegisteredApplication.count} registered_applications created"
