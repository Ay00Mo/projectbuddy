class Procedure < ApplicationRecord
  has_many :case_procedures
  has_many :cases, through: :case_procedures

  validates :procedure_name, presence: true,
                           uniqueness: { message: 'already exists. Please choose another name.' }, # rubocop:disable Layout/HashAlignment
                           format: { with: /\A[ぁ-んァ-ヶ一-龥々ーa-zA-Z0-9\-]+\z/, # rubocop:disable Style/RedundantRegexpEscape,Layout/HashAlignment
                           message: 'is invalid. Only full-width Japanese characters, alphabets, numbers, and hyphens are allowed.' } # rubocop:disable Layout/HashAlignment,Layout/LineLength
end
