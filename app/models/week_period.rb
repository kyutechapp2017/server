class WeekPeriod < ApplicationRecord
  validates :week_num, numericality: {greater_than: 0}
  validates :period_num, numericality: {greater_than: 0}
  has_many :subjects, through: :intermediates
  has_many :intermediates
end
