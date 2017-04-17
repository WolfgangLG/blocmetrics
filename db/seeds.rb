User.create!(
  email: 'l.w.gerdes@gmail.com',
  password: 'password',
  password_confirmation: 'password'
)

5.times do
  pw = Faker::Lorem.characters(7)
  User.create!(
    email:        Faker::Internet.email,
    password:     pw,
    password_confirmation: pw
  )
end
users = User.all

# Create Topics
10.times do
  name = Faker::App.name
  RegisteredApplication.create!(
    user:  users.sample,
    name:  name,
    url:   "www.#{name.gsub(" ","").downcase}.com"
  )
end
registered_applications = RegisteredApplication.all

puts "#{User.count} users created"
puts "#{RegisteredApplication.count} registered_applications created"
