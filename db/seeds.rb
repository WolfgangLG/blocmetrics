User.create!(

  name:             "Ludwig Gerdes",
  email:            "gerdesludwig@gmail.com",
  password:         "password",
  confirmed_at:     Date.today
)

5.times do
  User.create!(
    name:         Faker::Name.name,
    email:        Faker::Internet.email,
    password:     Faker::Lorem.characters(10),
    confirmed_at: Date.today
  )
end
users = User.all

25.times do
  name = Faker::App.name
  RegisteredApplication.create!(
    user: users.sample,
    name: name,
    url: "www.#{name.gsub(" ","").downcase}.com"
  )
end
registered_application = RegisteredApplication.all

puts "Seed finished"
puts "#{User.count} users created"
puts "#{RegisteredApplication.count} applications created"
