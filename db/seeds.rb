User.create!(name:  "snowboulder",
             email: "kevin.chao@mail.utoronto.ca",
             password:              "kd040409.",
             password_confirmation: "kd040409.",
             admin: true)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end
