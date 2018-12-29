require 'rails_helper'

# Test suite for the Investment model
RSpec.describe Investment, type: :model do
  # Association test
  # ensure an investment record belongs to a single campaign record
  it { should belong_to(:campaign) }

  # Validation tests
  # ensure required columns are present before saving
  it { should validate_presence_of(:investment_amount) }
end
