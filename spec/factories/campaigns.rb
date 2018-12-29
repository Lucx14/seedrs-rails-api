FactoryBot.define do
  factory :todo do
    campaign_name { Faker::Space.galaxy }
    campaign_image { Faker::Placeholdit.image }
    target_amount { Faker::Number.number(10) }
    sector { Faker::Job.field }
    country { Faker::WorldCup.team }
    investment_multiple { Faker::Number.decimal(2) }
  end
end
