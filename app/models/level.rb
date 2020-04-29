class Level < ApplicationRecord

  has_many :songs
  validates :name, presence: true
end
