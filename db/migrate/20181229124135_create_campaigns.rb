class CreateCampaigns < ActiveRecord::Migration[5.2]
  def change
    create_table :campaigns do |t|
      t.string :campaign_name
      t.string :campaign_image
      t.decimal :target_amount, precision: 15, scale: 2
      t.string :sector
      t.string :country
      t.decimal :investment_multiple, precision: 15, scale: 2

      t.timestamps
    end
  end
end
