class Subject < ApplicationRecord
  validates :url, presence: true, format: /\A#{URI::regexp(%w(http https))}\z/, unique: true
  validates :name, presence: true
  validates :code, unique: true
end
