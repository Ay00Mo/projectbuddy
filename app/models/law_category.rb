class LawCategory < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '特許' },
    { id: 3, name: '実用新案' },
    { id: 4, name: '意匠' },
    { id: 5, name: '商標' }
  ]

  include ActiveHash::Associations
  has_many :cases
end
