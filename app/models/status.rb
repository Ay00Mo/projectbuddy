class Status < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '処理中' },
    { id: 3, name: '原稿待ち' },
    { id: 4, name: '翻訳待ち' },
    { id: 5, name: '回答待ち' },
    { id: 6, name: '承認待ち' },
    { id: 7, name: '指示済み' },
    { id: 8, name: '提出済み' },
    { id: 9, name: 'チェック中' },
    { id: 10, name: '放棄' }
  ]

  include ActiveHash::Associations
  has_many :cases
end
