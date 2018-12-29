class InvestmentsController < ApplicationController
  before_action :set_campaign

  def index
    json_response(@campaign.investments)
  end



  private

  def set_campaign
    @campaign = Campaign.find(params[:campaign_id])
  end


end
