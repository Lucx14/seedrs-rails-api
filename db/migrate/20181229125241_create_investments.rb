class CreateInvestments < ActiveRecord::Migration[5.2]
  def change
    create_table :investments do |t|
      t.decimal :investment_amount, precision: 15, scale: 2
      t.boolean :done
      t.references :campaign, foreign_key: true

      t.timestamps
    end
  end
end
