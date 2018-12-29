FactoryBot.define do
  factory :investment do
    investment_amount { Faker::Number.decimal(2) }
    done { false }
    campaign_id { nil }
  end
end
