FactoryBot.define do
  factory :rate do
    title { "MyString" }
    text { "" }
    tariff { 1 }
    price { 1 }
    course { nil }
  end
end
