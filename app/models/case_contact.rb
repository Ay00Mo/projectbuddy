class CaseContact < ApplicationRecord
  belongs_to :case
  belongs_to :contact
end
