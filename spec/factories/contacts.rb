FactoryBot.define do
  factory :contact do
    last_name_jp { ['山田', '佐藤', 'スミス'].sample } # rubocop:disable Style/WordArray
    first_name_jp { ['太郎', '次郎', 'ジョン'].sample } # rubocop:disable Style/WordArray
    last_name_en { ['Yamada', 'Sato', 'Smith'].sample } # rubocop:disable Style/WordArray,Style/StringLiterals,Lint/RedundantCopDisableDirective
    first_name_en { ['Taro', 'Jiro', 'John'].sample } # rubocop:disable Style/WordArray
  end
end
