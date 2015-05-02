FactoryGirl.define do
  factory :issue do
    sequence(:name)  { |n| "Issue #{n}" }
    sequence(:position)  { |n| n }
  end
end
