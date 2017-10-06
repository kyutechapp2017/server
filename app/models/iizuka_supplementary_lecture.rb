class IizukaSupplementaryLecture < ApplicationRecord
  validates :url, presence: true, format: /\A#{URI::regexp(%w(http https))}\z/, uniqueness: true
end
