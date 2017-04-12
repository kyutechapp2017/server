class IizukaLecture < ApplicationRecord
  validates :url, presence: true
  validates :board_id, presence: true
end
