FactoryBot.define do
  factory :procedure do
    procedure_name { ['しんきしゅつがん', '拒絶理由通知', '累積年金', '312補正', 'Non-final OA'].sample }
  end
end
