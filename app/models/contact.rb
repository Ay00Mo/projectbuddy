class Contact < ApplicationRecord
  has_many :case_contacts
  has_many :cases, through: :case_contacts

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters.' } do
    validates :last_name_jp
    validates :first_name_jp
  end
  with_options presence: true,
               format: { with: /\A[A-Z][a-zA-Z' -]+\z/, message: 'is invalid. Input valid English characters.' } do
    validates :last_name_en
    validates :first_name_en
  end

  def full_name
    "#{last_name_jp} #{first_name_jp}"
  end
end
