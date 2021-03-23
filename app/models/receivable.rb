class Receivable < ApplicationRecord
  validates :expired_at, :key, presence: true
  validates_uniqueness_of :key, case_sensitive: false
end
