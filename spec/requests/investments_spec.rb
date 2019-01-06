require 'rails_helper'

RSpec.describe 'Investments API' do 
  # Initialize the test data
  let(:user) { create(:user) }
  let!(:campaign) { create(:campaign) }
  let!(:investments) { create_list(:investment, 20, campaign_id: campaign.id, created_by: user.id) }
  let(:campaign_id) { campaign.id }
  let(:id) { investments.first.id }
  let(:headers) { valid_headers }

  # Test suite for GET /campaigns/:campaign_id/investments
  describe 'GET /campaigns/:campaign_id/investments' do
    before { get "/campaigns/#{campaign_id}/investments", params: {}, headers: headers }

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

  # Test suite for GET /campaigns/:campaign_id/investments/:id
  describe 'GET /campaigns/:campaign_id/investments/:id' do
    before { get "/campaigns/#{campaign_id}/investments/#{id}", params: {}, headers: headers }

    context 'when campaign investment exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the investment' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when campaign investment does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Investment/)
      end 
    end
  end

  # Test suite for POST /campaigns/:campaign_id/investments
  describe 'POST /campaigns/:campaign_id/investments' do
    let(:valid_attributes) { { investment_amount: 10.00, created_by: user.id }.to_json }
    # Need to figure out how to link the investments to the user

    context 'when request attributes are valid' do
      before { post "/campaigns/#{campaign_id}/investments", params: valid_attributes, headers: headers }

      it 'returns status code 201' do
        
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/campaigns/#{campaign_id}/investments", params: {}, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Investment amount can't be blank/)
      end
    end
  end

  # Test suite for PUT /campaigns/:campaign_id/investments/:id
  describe 'PUT /campaigns/:campaign_id/investments/:id' do
    let(:valid_attributes) { { investment_amount: 10.00, created_by: user.id }.to_json }

    before { put "/campaigns/#{campaign_id}/investments/#{id}", params: valid_attributes, headers: headers }

    context 'when investment exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the investment' do
        updated_investment = Investment.find(id)
        expect(updated_investment.investment_amount).to match(10.00)
      end
    end

    context 'when the investment does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Investment/)
      end
    end
  end

  # Test suite for DELETE /campaigns/:campaign_id/investments/:id
  describe 'DELETE /campaigns/:campaign_id/investments/:id' do
    before { delete "/campaigns/#{campaign_id}/investments/#{id}", params: {}, headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
