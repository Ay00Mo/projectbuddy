FactoryBot.define do
  factory :case do
    reference_number { 'Ref#001' }
    application_number { 'App123#$%' }
    country_code { Faker::Address.country_code }
    law_category_id { Faker::Number.between(from: 2, to: 5) }
    category_id { Faker::Number.between(from: 2, to: 5) }
    status_id { Faker::Number.between(from: 2, to: 10) }
    beginning_date { '2024/05/10' }
    deadline { '2024/09/10' }
    absolute_deadline { '2024/10/10' }
    request_date { '2024/05/15' }
    delivery_date { '2024/06/10' }
    response_date { '2024/07/15' }
    instruction_date { '2024/08/10' }
    filing_date { '2024/09/06' }
    remarks { Faker::Lorem.sentence }
    association :user
    internal_contact { association :user }
  end
end
