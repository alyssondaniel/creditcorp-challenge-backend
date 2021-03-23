FactoryBot.define do
  factory :receivable do
    net_value { Faker::Commerce.price }
    expired_at { Faker::Date.forward(days: 23) }
    key { Faker::Internet.uuid }

    association :company
  end
end
