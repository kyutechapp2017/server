class IizukaScholarship < ApplicationRecord
  validates :url, presence: true, format: /\A#{URI::regexp(%w(http https))}\z/, unique: true
  validates :attachment_1_url, presence: true, format: /\A#{URI::regexp(%w(http https))}\z/
  validates :attachment_2_url, presence: true, format: /\A#{URI::regexp(%w(http https))}\z/
end
