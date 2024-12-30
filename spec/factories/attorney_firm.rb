FactoryBot.define do
  factory :attorney_firm do
    firm_name_jp { ['山田特許事務所', '佐藤特許事務所', 'スミス & ジョン'].sample }
    firm_name_en { ['Yamada and Associates', 'Sato and Associates', 'Smith & John LLP'].sample }
  end
end
