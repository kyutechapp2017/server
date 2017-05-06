class IizukaStudyingAbroad < ApplicationRecord
  validates :url, presence: true, format: /\A#{URI::regexp(%w(http https))}\z/, uniqueness: true
  validates :attachment_1_url, allow_blank: true, format: /\A#{URI::regexp(%w(http https))}\z/
  validates :attachment_2_url, allow_blank: true, format: /\A#{URI::regexp(%w(http https))}\z/
  validates :attachment_3_url, allow_blank: true, format: /\A#{URI::regexp(%w(http https))}\z/
  validates :attachment_4_url, allow_blank: true, ormat: /\A#{URI::regexp(%w(http https))}\z/
end
