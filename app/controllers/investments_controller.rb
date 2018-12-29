class InvestmentsController < ApplicationController
  before_action :set_campaign
  before_action :set_campaign_investment, only: [:show, :update, :destroy]

  # GET /campaigns/:campaign_id/investments
  def index
    json_response(@campaign.investments)
  end

  # GET /campaigns/:campaign_id/investments/:id
  def show
    json_response(@investment)
  end

  # POST /campaigns/:campaign_id/investments/:id
  def create
    @campaign.investments.create!(investment_params)
    json_response(@campaign, :created)
  end

  # PUT /campaigns/:campaign_id/investments/:id
  def update
    @investment.update(investment_params)
    head :no_content
  end



  private

  def investment_params
    params.permit(:investment_amount)
  end

  def set_campaign
    @campaign = Campaign.find(params[:campaign_id])
  end

  def set_campaign_investment
    @investment = @campaign.investments.find_by!(id: params[:id]) if @campaign
  end


end
