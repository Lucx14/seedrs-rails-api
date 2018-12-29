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


  private

  def set_campaign
    @campaign = Campaign.find(params[:id])
  end


end
