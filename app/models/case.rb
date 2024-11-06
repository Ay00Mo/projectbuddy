class Case < ApplicationRecord
  belongs_to :user
  belongs_to :law_category
  belongs_to :category
  belongs_to :status

  validates :law_category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :status_id, numericality: { other_than: 1, message: "can't be blank" }
end
