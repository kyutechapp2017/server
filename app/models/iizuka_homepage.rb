class IizukaHomepage < ApplicationRecord
  validates :url, presence: true
  validates :board_id, presence: true
end
