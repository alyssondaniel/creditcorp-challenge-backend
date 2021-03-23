FactoryBot.define do
  factory :company do
    name { Faker::Company.name }
    document { Faker::Company.brazilian_company_number(formatted: true) }
  end
end
