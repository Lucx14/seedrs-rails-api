require 'rails_helper'

# Test suite for the Campaign model
RSpec.describe Campaign, type: :model do
  # Association test
  # ensure Campaign model has a 1:m relationship with the Investment model
  it { should have_many(:investments).dependent(:destroy) }

  # Validation tests
  # ensure required columns are present before saving
  it { should validate_presence_of(:campaign_name) }
  it { should validate_presence_of(:campaign_image) }
  it { should validate_presence_of(:target_amount) }
  it { should validate_presence_of(:sector) }
  it { should validate_presence_of(:country) }
  it { should validate_presence_of(:investment_multiple) }
end
