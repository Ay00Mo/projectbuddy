class Procedure < ApplicationRecord
  has_many :case_procedures
  has_many :cases, through: :case_procedures

  validates :procedure_name, presence: true,
                             format: { with: /\A[ぁ-んァ-ヶ一-龥々ーa-zA-Z0-9]+\z/, message: 'is invalid. Only full-width Japanese characters, alphabets, and numbers are allowed.' }
end
