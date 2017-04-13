class WeekPeriod < ApplicationRecord
  validates :week_num, numericality: {greater_than: 0}
  validates :period_num, numericality: {greater_than: 0}
end
