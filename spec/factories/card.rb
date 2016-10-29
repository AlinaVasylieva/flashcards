FactoryGirl.define do
  factory :card do |f|
    f.original_text "Hello"
    f.translated_text "Привет"
    f.review_date (Date.today + 3.days)
  end
end
