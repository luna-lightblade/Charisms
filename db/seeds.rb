User.create!(name:  "Example User",
             email: "example@gmail.com",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@gmail.com"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

150.times do |n|
  sayer = Faker::Name.name
  quote = Faker::Hacker.say_something_smart
  context = Faker::Hipster.sentence
  Quote.create!(sayer: sayer,
                quote: quote,
                context: context,
                user_id: rand(90))
end
