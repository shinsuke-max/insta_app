FactoryBot.define do
  factory :photo do
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.png')) }
    association :post
    association :user
  end
end
