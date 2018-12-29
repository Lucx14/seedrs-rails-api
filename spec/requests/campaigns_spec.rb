require 'rails_helper'

RSpec.describe 'Campaigns API', type: :request do

  # initialize test data
  let!(:campaigns) { create_list(:campaign, 10) }
  let(:campaign_id) { campaign.first.id }

  # Test suite for GET /campaigns
  describe 'GET /campaigns' do
    # make HTTP get request before each example
    before { get '/campaigns' }

    it 'returns todos' do
      # note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end



end
