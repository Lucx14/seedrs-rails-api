require 'rails_helper'

RSpec.describe 'Campaigns API', type: :request do

  # initialize test data
  let!(:campaigns) { create_list(:campaign, 10) }
  let(:campaign_id) { campaigns.first.id }

  # Test suite for GET /campaigns
  describe 'GET /campaigns' do
    # make HTTP get request before each example
    before { get '/campaigns' }

    it 'returns campaigns' do
      # note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /campaigns/:id
  describe 'GET /campaigns/:id' do
    before { get "/campaigns/#{campaign_id}" }

    context 'when the record exists' do
      it 'returns the campaign' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(campaign_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:campaign_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Campaign/)
      end
    end
  end

  # Test suite for POST /campaigns
  describe 'POST /campaigns' do
    # valid payload
    let(:valid_attributes) { { campaign_name: 'test name', campaign_image: 'test url', target_amount: 1000, sector: 'test sector', country: 'test country', investment_multiple: 10.00 } }

    context 'when the request is valid' do
      before { post '/campaigns', params: valid_attributes }

      it 'creates a campaign' do
        expect(json['campaign_name']).to eq('test name')
      end

      it 'returns a status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is not valid' do
      before { post '/campaigns', params: { campaign_image: 'test url', target_amount: 1000, sector: 'test sector', country: 'test country', investment_multiple: 10.00 } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Campaign name can't be blank/)
      end
    end
  end

  


end
