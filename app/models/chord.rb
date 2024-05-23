class Chord < ApplicationRecord
  validates :name, presence: true
  validates :feeling, presence: true
  validates :notes, presence: true
  validates :relationship, presence: true

  belongs_to :song
end
