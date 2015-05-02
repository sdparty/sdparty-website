FactoryGirl.define do
  factory :candidate do
    sequence(:name)  { |n| "Candidate #{n}" }
    sequence(:description)  { |n| "Candidate description #{n}" }
    sequence(:constituency)  { |n| "Candidate constituency #{n}" }
    fb_link "http://www.google.com/"
    help_link "http://www.google.com/"
    help_image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'fixtures', 'test.jpg')) }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'fixtures', 'test.jpg')) }
    published true
  end
end
