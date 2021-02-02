50.times do
  task = Task.create(title: Faker::Lorem.word, created_by: User.first.id)
  task.points.create(name: Faker::Lorem.word, done: false)
end