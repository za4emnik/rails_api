FactoryGirl.define do
  factory :task do
    association :user
    image_id {Faker::Number.between(1, 100)}
    #association :image
    task_type { Faker::Lorem.characters(5) }
    params { Faker::Lorem.characters(5) }
  end
end
