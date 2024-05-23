class Song < ApplicationRecord
  validates :title, presence: true
  validates :genre, presence: true
  validates :vibe, presence: true
  validates :description, presence: true
  validates :tempo, presence: true
  validates :form, presence: true
  validates :lyrics, presence: true
  validates :instrumentation, presence: true

  belongs_to :user
  has_many :instruments
  has_many :chords
end
