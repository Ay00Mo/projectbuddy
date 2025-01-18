class Case < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :law_category
  belongs_to :category
  belongs_to :status
  belongs_to :internal_contact, class_name: 'User'
  has_many :case_contacts, dependent: :destroy
  has_many :contacts, through: :case_contacts
  has_many :case_attorney_firms, dependent: :destroy
  has_many :attorney_firms, through: :case_attorney_firms
  has_many :case_applicants, dependent: :destroy
  has_many :applicants, through: :case_applicants
  has_many :case_procedures, dependent: :destroy
  has_many :procedures, through: :case_procedures

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

  validate :must_have_required_fields

  def self.ransackable_attributes(_auth_object = nil)
    %w[
      absolute_deadline
      application_number
      beginning_date
      category_id
      country_code
      created_at
      deadline
      delivery_date
      filing_date
      id
      instruction_date
      internal_contact_id
      law_category_id
      reference_number
      remarks
      request_date
      response_date
      status_id
      updated_at
      user_id
    ]
  end

  # 出願人や代理人など関連するモデルの検索も可能にする場合
  def self.ransackable_associations(_auth_object = nil)
    %w[applicants attorney_firms contacts procedures users]
  end

  private

  def check_deadlines
    if deadline.present? && absolute_deadline.present? && deadline >= absolute_deadline # rubocop:disable Style/GuardClause
      errors.add(:deadline, "should be on or before the absolute deadline") # rubocop:disable Style/StringLiterals
    end
  end

  def must_have_required_fields
    required_fields = {
      contacts: contact_ids,
      attorney_firms: attorney_firm_ids
    }

    required_fields.each do |attribute, value|
      errors.add(attribute, "can't be blank") if value.blank?
    end
  end
end
