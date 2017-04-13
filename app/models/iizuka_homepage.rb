class IizukaHomepage < ApplicationRecord
  validates :url, presence: true, format: /\A#{URI::regexp(%w(http https))}\z/, unique: true
  validates :board_id, presence: true, numericality: {greater_than: 0}
end
