FactoryGirl.define do
  factory :session do
    #association :user
    user_id {Faker::Number.between(1, 100)}
    token { Faker::Lorem.characters(15) }
  end
end
