class Song < ApplicationRecord
  belongs_to :artist
  belongs_to :style
  belongs_to :level
end
