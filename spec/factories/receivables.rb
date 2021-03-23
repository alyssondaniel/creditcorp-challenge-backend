FactoryBot.define do
  factory :receivable do
    net_value { Faker::Commerce.price }
    expired_at { Faker::Date.forward(days: [5, 10, 15, 20, 25, 30].sample) }
    key { Faker::Internet.uuid }

    association :company
  end
end
