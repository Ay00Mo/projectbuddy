class AttorneyFirm < ApplicationRecord
  has_many :case_attorney_firms
  has_many :cases, through.case_attorney_firms
end
