FactoryGirl.define do
  factory :banner do
    sequence(:title) { |n| "Title #{n}" }
    sequence(:button) { |n| "Button #{n}" }
    link "http://www.google.com/"
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'fixtures', 'banner.jpg')) }
    published true
  end
end
