User.create!(name: "テストユーザー",
             email: "test@insta.org",
             password: "testtest",
             password_confirmation: "testtest")

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@insta.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

19.times do |n|
  caption = Faker::Lorem.sentence(5)
  user_id = "#{n+1}"
  Post.create!(caption: caption, user_id: user_id).photos.create!(image: File.open("./app/assets/images/seed/image-#{n+1}.jpg"))
end
