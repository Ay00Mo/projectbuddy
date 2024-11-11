class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '出願' },
    { id: 3, name: '中間' },
    { id: 4, name: '登録' },
    { id: 5, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :cases
end
