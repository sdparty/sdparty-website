FactoryGirl.define do
  factory :candidate do
    year 2016
    kind 'legislator'
    sequence(:name)  { |n| "Candidate #{n}" }
    sequence(:description)  { |n| "Candidate description #{n}" }
    sequence(:constituency)  { |n| "Candidate constituency #{n}" }
    avatar { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'fixtures', 'test.jpg')) }
    fb_link "http://www.google.com/"
    help_link "http://www.google.com/"
    help_image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'fixtures', 'test.jpg')) }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'fixtures', 'test.jpg')) }
    published true
    sequence(:donate_form) { |n| "Candidate donate form #{n}" }
    donate_image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'fixtures', 'test.jpg')) }
    sequence(:job) { |n| "Candidate job #{n}" }
    sequence(:education) { |n| "Candidate education #{n}" }
    sequence(:experience) { |n| "Candidate experience #{n}" }
  end
end
