FactoryGirl.define do
  factory :article do
    sequence(:title)  { |n| "Article title #{n}" }
    sequence(:content)  { |n| "Article content #{n}" }
    sequence(:published_at) { |n| n.days.ago }
    issues {[ FactoryGirl.create(:issue) ]}
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'fixtures', 'test.jpg')) }
    published true
  end

  factory :press_article, parent: :article do
    kind "press"
  end

  factory :activity_article, parent: :article do
    kind "activity"
  end

  factory :issue_article, parent: :article do
    kind "issue"
  end

  factory :donate_article, parent: :article do
    kind "system"
    id 1
  end
end



