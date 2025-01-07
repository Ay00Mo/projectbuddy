class Applicant < ApplicationRecord
  has_many :case_applicants
  has_many :cases, through: :case_applicants

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters.' } do
    validates :applicant_name_jp
  end
  with_options presence: true,
               format: { with: /\A[a-zA-Z\s.,]+\z/, message: 'is invalid. Input valid English characters.' } do
    validates :applicant_name_en
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[applicant_name_en applicant_name_jp created_at id updated_at]
  end
end
