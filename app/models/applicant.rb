class Applicant < ApplicationRecord
  has_many :case_applicants
  has_many :cases, through: :case_applicants
end
