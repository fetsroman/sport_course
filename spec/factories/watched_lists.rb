FactoryBot.define do
  factory :watched_list do
    user { nil }
    lesson_id { 1 }
    watched { false }
  end
end
