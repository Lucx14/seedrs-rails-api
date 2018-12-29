class Campaign < ApplicationRecord
  # model association
  has_many :investments, dependent: :destroy

  # validations
  validates_presence_of :campaign_name, :campaign_image, :target_amount, :sector, :country, :investment_multiple
end
