class IizukaScholarship < ApplicationRecord
  validates :url, presence: true, format: { with: /\A[a-z0-9]+\z/i }
  validates :attachment_1_url, presence: true, format: { with: /\A[a-z0-9]+\z/i }
  validates :attachment_2_url, presence: true, format: { with: /\A[a-z0-9]+\z/i }
end
