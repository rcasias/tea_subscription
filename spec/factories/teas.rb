FactoryBot.define do
  factory :tea do
    title { Faker::Tea.variety }
    description { Faker::Lorem.paragraph(sentence_count: 4) }
    temperature { Faker::Number.within(range: 150..220) }
    brew_time { Faker::Number.within(range: 1..3).to_s + "-" + Faker::Number.within(range: 4..10).to_s + " minutes"}
    price { Faker::Number.within(range: 3..6) }
  end
end
