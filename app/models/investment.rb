class Investment < ApplicationRecord
  # model association
  belongs_to :campaign

  # validation
  validates_presence_of :investment_amount
end
