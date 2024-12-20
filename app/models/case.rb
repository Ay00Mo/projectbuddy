class Case < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :law_category
  belongs_to :category
  belongs_to :status
  belongs_to :internal_contact, class_name: 'User'
  has_many :case_contacts
  has_many :contacts, through: :case_contacts
  has_many :case_attorney_firms
  has_many :attorney_firms, through: :case_attorney_firms

  VALID_CHARACTERS_REGEX = %r{\A[!\#$%&',\-./a-zA-Z0-9]+\z}
  validates :reference_number, presence: true,
                               format: { with: VALID_CHARACTERS_REGEX,
                                         message: 'is invalid. Only alphanumeric characters and allowed symbols (!#$%&’, -/) are permitted' } # rubocop:disable Layout/LineLength
  validates :application_number, presence: true,
                                 format: { with: VALID_CHARACTERS_REGEX,
                                           message: 'is invalid. Only alphanumeric characters and allowed symbols (!#$%&’, -/) are permitted' } # rubocop:disable Layout/LineLength
  validates :country_code, presence: true, format: { with: /\A[A-Z]{2}\z/, message: 'should be 2 capital letters' }
  validates :beginning_date, presence: true
  validates :deadline, presence: true
  validates :absolute_deadline, presence: true
  validate :check_deadlines

  validates :law_category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :status_id, numericality: { other_than: 1, message: "can't be blank" }

  validate :must_have_one_contact

  private

  def check_deadlines
    if deadline.present? && absolute_deadline.present? && deadline >= absolute_deadline # rubocop:disable Style/GuardClause
      errors.add(:deadline, "should be on or before the absolute deadline") # rubocop:disable Style/StringLiterals
    end
  end

  def must_have_one_contact
    if contact_ids.blank? # rubocop:disable Style/IfUnlessModifier,Style/GuardClause
      errors.add(:contacts, "can't be blank")
    end
  end
end
