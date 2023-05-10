require 'faker'

# Create 5 users
10.times do
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email
  )
end

# Create todos for each user
User.all.each do |user|
  3.times do
    user.todos.create(
      title: Faker::Lorem.sentence,
      description: Faker::Lorem.paragraph,
      completed: [true, false].sample
    )
  end
end
