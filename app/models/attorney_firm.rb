class AttorneyFirm < ApplicationRecord
  has_many :case_attorney_firms
  has_many :cases, through: :case_attorney_firms

  before_validation :normalize_firm_names

  with_options presence: true,
               format: { with: /\A[ぁ-んァ-ヶ一-龥々ーa-zA-Z0-9&' -]+\z/, message: 'is invalid. Use only valid characters.' } do
    validates :firm_name_jp
  end

  with_options presence: true,
               format: { with: /\A[A-Za-z0-9&' -]+\z/, message: 'is invalid. Input valid English characters.' } do
    validates :firm_name_en
  end

  private

  def normalize_firm_names
    normalize_space(:firm_name_jp)
    normalize_space(:firm_name_en)
  end

  def normalize_space(attribute)
    return unless self[attribute].present?

    # 全角スペースを半角スペースに変換し、複数スペースを1つにまとめる
    self[attribute] = self[attribute].gsub(/[\s　]+/, ' ')
  end
end
