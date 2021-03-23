class Receivable < ApplicationRecord
  belongs_to :company

  validates :expired_at, :key, presence: true
  validates_uniqueness_of :key, case_sensitive: false

  def calc_anticipation

  end
end
