user_amount = 50
quote_amount = 150

# Create users
user_amount.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@example.com"
  password = 'password'
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

# Create an admin account
User.create!(name: 'Admin',
             email: 'admin@example.com',
             password: 'password',
             password_confirmation: 'password',
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

# Create quotes
quote_amount.times do
  sayer = Faker::Name.name
  quote = Faker::Hacker.say_something_smart
  context = rand(3) == 1 ? Faker::Company.catch_phrase : ''
  Quote.create!(sayer: sayer,
                quote: quote,
                context: context,
                user_id: rand(1..user_amount))
end

# Create likes
20.times do |n|
  n.times do |i|
    Like.create!(user_id: i+1, quote_id: quote_amount - n)
  end
end
