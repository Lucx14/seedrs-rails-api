FactoryBot.define do
  factory :investment do
    investment_amount { Faker::Number.decimal(2) }
    created_by { Faker::Number.number(10) }
    campaign_id { nil }
  end
end
