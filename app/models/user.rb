class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cases

  validates :last_name, :first_name, presence: true,
                                     format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters.' }
  validate :password_complexity
  validates :pin_number, presence: true, format: { with: /\A[0-9]{4}\z/, message: 'is invalid. Input 4 digit numbers.' }
  validates :user_type, presence: true, format: { with: /\A[1-2]{1}\z/, message: 'is invalid. Input 1 or 2.' }

  def full_name
    "#{last_name} #{first_name}"
  end

  private

  def password_complexity
    return if password.blank?

    if password =~ /\A[a-zA-Z]+\z/ # rubocop:disable Style/IfUnlessModifier
      errors.add(:password, 'cannot be only letters')
    end

    if password =~ /\A\d+\z/ # rubocop:disable Style/IfUnlessModifier
      errors.add(:password, 'cannot be only numbers')
    end

    return unless password =~ /[^\x00-\x7F]/

    errors.add(:password, 'cannot include full-width characters')
  end
end
