FactoryGirl.define do
  factory :image do
    user_id { Faker::Number.between(1, 100) }
    image { Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/myfiles/test_image.jpeg'))) }
  end
end
