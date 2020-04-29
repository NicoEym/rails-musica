class Song < ApplicationRecord
  belongs_to :artist
  belongs_to :style
  belongs_to :level
  validates :title, presence: true
  validates :lyrics, presence: true
  validates :link_ytb, presence: true
end
