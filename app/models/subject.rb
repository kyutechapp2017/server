class Subject < ApplicationRecord
  validates :url, presence: true, format: /\A#{URI::regexp(%w(http https))}\z/, uniqueness: true
  validates :name, presence: true
  validates :code, unique: true
  validates :campus_id, numericality: {greater_than: 0}
  validates :num_of_unit, numericality: {greater_than: 0}
end
