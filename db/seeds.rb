# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create!(email: 'gowtham.duraisamy@mallow-tech.com', password: '12345678', password_confirmation: '12345678')

1000.times.map do
  Post.create!(content: Faker::Twitter.status[:text], user_id: user.id)
end
