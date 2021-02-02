FactoryBot.define do
  factory :point do
    name { Faker::Lorem.word }
    done { false }
    task_id { nil }
  end
end