class CaseApplicant < ApplicationRecord
  belongs_to :case
  belongs_to :applicant
end
