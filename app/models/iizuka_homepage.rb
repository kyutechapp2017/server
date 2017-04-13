class IizukaHomepage < ApplicationRecord
  validates :url, presence: true, format: { with: /\A[a-z0-9]+\z/i }, unique: true
  validates :board_id, presence: true
end
