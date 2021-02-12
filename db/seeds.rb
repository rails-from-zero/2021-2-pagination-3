# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

post_data = YAML.load_file(Rails.root.join("lib/seeds/fixtures.yml"))
post_data.each.with_index do |data, i|
  Post.create!(
    title: data.fetch(:title),
    body: data.fetch(:description),
    created_at: (1..100).to_a.sample.days.ago,
    image_path: "/images/#{i + 1}.jpg"
  )
end

posts = Post.order(created_at: :desc)

5.times do
  posts.first.comments.create!(
    username: Faker::Name.name,
    body: Faker::Lorem.sentence(word_count: rand(100) + 20)
  )
end

145.times do
  posts.third.comments.create!(
    username: Faker::Name.name,
    body: Faker::Lorem.sentence(word_count: rand(100) + 20)
  )
end
