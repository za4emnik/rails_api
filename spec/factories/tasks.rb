FactoryGirl.define do
  factory :task do
    user_id { Faker::Number.between(1, 100) }
    image_id { Faker::Number.between(1, 100) }
    task_type { Faker::Lorem.characters(5) }
    params { Faker::Lorem.characters(5) }
  end
end
