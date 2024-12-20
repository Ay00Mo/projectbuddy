class CaseAttorneyFirm < ApplicationRecord
  belongs_to :case
  belongs_to :attorney_firm
end
