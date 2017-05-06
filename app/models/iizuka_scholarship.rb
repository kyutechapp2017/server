class IizukaScholarship < ApplicationRecord
  validates :url, presence: true, format: /\A#{URI::regexp(%w(http https))}\z/, uniqueness: true
  validates :attachment_1_url, allow_blank: true, format: /\A#{URI::regexp(%w(http https))}\z/
  validates :attachment_2_url, allow_blank: true, format: /\A#{URI::regexp(%w(http https))}\z/
end
