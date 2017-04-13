class Intermediate < ApplicationRecord
  validates :subject_id, numericality: {greater_than: 0}
  validates :week_period_id, numericality: {greater_than: 0}
end
