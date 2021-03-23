FactoryBot.define do
  factory :receivable do
    net_value { Faker::Commerce.price }
    expired_at { Faker::Date.forward(days: [30, 60, 90, 120].sample) }
    key { Faker::Internet.uuid }

    association :company
  end
end
