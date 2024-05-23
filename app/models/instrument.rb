class Instrument < ApplicationRecord
  validates :name, presence: true
  validates :type, presence: true

  belongs_to :song
end
