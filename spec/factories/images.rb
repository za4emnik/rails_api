FactoryGirl.define do
  factory :image do
    association :user
    image { Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/myfiles/test_image.jpeg'))) }
  end
end
