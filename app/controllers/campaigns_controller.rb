class CampaignsController < ApplicationController
  before_action :set_campaign, only: [:show, :update, :destroy]

  # GET /campaigns
  def index
    @campaigns = Campaign.all
    json_response(@campaigns)
  end

  # GET /campaigns/id
  def show
    json_response(@campaign)
  end


  # POST /campaigns
  def create
    @campaign = Campaign.create!(campaign_params)
    json_response(@campaign, :created)
  end


  # PUT /campaigns/:id
  def update
    @campaign.update(campaign_params)
    head :no_content
  end 


  # DELETE /campaigns/:id
  def destroy
    @campaign.destroy
    head :no_content
  end


  private

  def set_campaign
    @campaign = Campaign.find(params[:id])
  end

  def campaign_params
    # whitelist params
    params.permit(:campaign_name, :campaign_image, :target_amount, :sector, :country, :investment_multiple)
  end
end
