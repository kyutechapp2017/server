class Subject < ApplicationRecord
  validates :url, presence: true, format: { with: /\A[a-z0-9]+\z/i }, unique: true
  validates :name, presence: true
end
