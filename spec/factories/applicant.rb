FactoryBot.define do
  factory :applicant do
    applicant_name_jp { ['日本データ分析株式会社', '株式会社新星ソリューション', '株式会社未来エネルギー '].sample }
    applicant_name_en { ['Japan Data Analytics Inc.', 'Shinsei Solutions Ltd.', 'Future Energy Corp.'].sample }
  end
end
