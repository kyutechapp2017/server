class Intermediate < ApplicationRecord
  belongs_to :subject, optional: true
  belongs_to :week_period
end
