class Contact < ApplicationRecord
  has_many :case_contacts
  has_many :cases, through: :case_contacts
end
