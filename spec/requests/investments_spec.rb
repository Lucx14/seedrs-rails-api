require 'rails_helper'

RSpec.describe 'Investments API' do 
  # Initialize the test data
  let!(:campaign) { create(:campaign) }
  let!(:investments) { create_list(:investment, 20, campaign_id: campaign.id) }
  let(:campaign_id) { campaign.id }
  let(:id) { items.first.id }

  # Test suite for GET /campaigns/:campaign_id/investments
  describe 'GET /campaigns/:campaign_id/investments' do
    before { get "/campaigns/#{campaign_id}/investments" }

    context 'when campaign exist' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all campaign investments' do
        expect(json.size).to eq(20)
      end
    end

    context 'when campaign does not exist' do

      let(:campaign_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Campaign/)
      end
    end
  end
end
