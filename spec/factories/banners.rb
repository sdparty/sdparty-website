FactoryGirl.define do
  factory :banner do
    sequence(:title)  { |n| "Banner title #{n}" }
    sequence(:button)  { |n| "Banner button #{n}" }
    link "http://www.google.com/"
    sequence(:position)  { |n| n }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'fixtures', 'test.jpg')) }
    published true
  end
end
