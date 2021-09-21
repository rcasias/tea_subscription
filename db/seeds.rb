# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


9.times do
  Customer.create(first_name: Faker::Name.first_name,
                  last_name: Faker::Name.last_name,
                  email: Faker::Internet.unique.email,
                  address: Faker::Address.street_address,
                  city: Faker::Address.city,
                  state: Faker::Address.state,
                  zip: Faker::Address.zip
                )
end

9.times do
  Tea.create(title: Faker::Tea.variety,
            description: Faker::Lorem.paragraph(sentence_count: 4),
            temperature: Faker::Number.within(range: 150..220),
            brew_time: Faker::Number.within(range: 1..3).to_s + "-" + Faker::Number.within(range: 4..10).to_s + " minutes",
            price: Faker::Number.within(range: 3..6))
end

Subscription.create(customer_id: 1,tea_id: 4, frequency: 30)
Subscription.create(customer_id: 1,tea_id: 2, frequency: 30)
Subscription.create(customer_id: 1,tea_id: 1, frequency: 30)
Subscription.create(customer_id: 1,tea_id: 3, frequency: 30)

Subscription.create(customer_id: 2,tea_id: 9, frequency: 30)
Subscription.create(customer_id: 2,tea_id: 1, frequency: 30)
Subscription.create(customer_id: 2,tea_id: 7, frequency: 30)
Subscription.create(customer_id: 2,tea_id: 2, frequency: 30)
Subscription.create(customer_id: 2,tea_id: 6, frequency: 30)

Subscription.create(customer_id: 3,tea_id: 4, frequency: 30)
Subscription.create(customer_id: 3,tea_id: 1, frequency: 30)

Subscription.create(customer_id: 4,tea_id: 8, frequency: 30)

Subscription.create(customer_id: 5,tea_id: 1, frequency: 30)
Subscription.create(customer_id: 5,tea_id: 7, frequency: 30)
Subscription.create(customer_id: 5,tea_id: 3, frequency: 30)

Subscription.create(customer_id: 6,tea_id: 6, frequency: 30)
Subscription.create(customer_id: 6,tea_id: 2, frequency: 30)

Subscription.create(customer_id: 7,tea_id: 1, frequency: 30)
Subscription.create(customer_id: 7,tea_id: 5, frequency: 30)
Subscription.create(customer_id: 7,tea_id: 3, frequency: 30)

Subscription.create(customer_id: 8,tea_id: 1, frequency: 30)
Subscription.create(customer_id: 8,tea_id: 5, frequency: 30)

Subscription.create(customer_id: 9,tea_id: 8, frequency: 30)
Subscription.create(customer_id: 9,tea_id: 3, frequency: 30)
