class IizukaNotice < ApplicationRecord
  validates :url, presence: true, format: { with: /\A[a-z0-9]+\z/i }, unique: true
  validates :attachment_1_url, presence: true, format: { with: /\A[a-z0-9]+\z/i }
  validates :attachment_2_url, presence: true, format: { with: /\A[a-z0-9]+\z/i }
  validates :attachment_3_url, presence: true, format: { with: /\A[a-z0-9]+\z/i }
  validates :attachment_4_url, presence: true, format: { with: /\A[a-z0-9]+\z/i }
  validates :attachment_5_url, presence: true, format: { with: /\A[a-z0-9]+\z/i }
end
