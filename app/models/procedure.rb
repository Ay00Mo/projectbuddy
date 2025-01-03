class Procedure < ApplicationRecord
  has_many :case_procedures
  has_many :cases, through: :case_procedures
end
