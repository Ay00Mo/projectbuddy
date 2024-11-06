class Case < ApplicationRecord
  belongs_to :user
  belongs_to :law_category
  belongs_to :category
  belongs_to :status

  validates :reference_number, presence: true,
                               format: { with: /\A[a-zA-Z0-9]+\z/, message: 'is invalid. Only alphanumeric characters are allowed' }
  validates :application_number, presence: true,
                                 format: { with: /\A[a-zA-Z0-9]+\z/, message: 'Only alphanumeric characters are allowed' }
  validates :country_code, presence: true, format: { with: /\A[A-Z]{2}\z/, message: 'should be 2 capital letters' }
  validates :beginning_date, presence: true
  validates :deadline, presence: true
  validates :absolute_deadline, presence: true
  validate :check_deadlines
  validate :validates_date_of, :beginning_date, :deadline, :absolute_deadline, :request_date, :delivery_date, :response_date,
           :instruction_date, :filing_date

  validates :law_category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :status_id, numericality: { other_than: 1, message: "can't be blank" }

  private

  def check_deadlines
    if deadline.present? && absolute_deadline.present? && deadline >= absolute_deadline # rubocop:disable Style/GuardClause
      errors.add(:deadline, "should be on or before the absolute deadline") # rubocop:disable Style/StringLiterals
    end
  end

  def validates_date_of(*attributes)
    attributes.each do |attribute|
      unless self[attribute].is_a?(Date) # rubocop:disable Style/IfUnlessModifier
        errors.add(attribute, 'should be a valid date')
      end
    end
  end
end
