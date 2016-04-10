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

Activity.create!(name: "Bouldering",
                 group: "Sporty",
                 description: "No harness, rope. You climb with no limit!",
                 range: "20-40",
                 duration: "2h - 2h 30 mins",
                 environment: "Indoor",
                 season: "All Season")

99.times do |n|
  name  = Faker::Team.name
  group = "Sporty" || "Leisure" || "Game"
  description = Faker::Lorem.paragraphs
  range = "#{n+10}-#{n+20}"
  duration = "#{n}h - #{n}h #{n*3-3}mins"
  environment = Faker::Lorem.words
  season = "Winter" || "Summer" || "All Season"
  Activity.create!(name:        name,
                   group:       group,
                   description: description,
                   range:       range,
                   duration:    duration,
                   environment: environment,
                   season:      season)
end
