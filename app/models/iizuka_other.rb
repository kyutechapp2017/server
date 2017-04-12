class IizukaOther < ApplicationRecord
  validates :url, presence: true
  validates :board_id, presence: true
end
