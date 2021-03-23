class Receivable < ApplicationRecord
  DAYS_AVG = 30

  belongs_to :company

  validates :expired_at, :key, presence: true
  validates_uniqueness_of :key, case_sensitive: false

  def calc_antecipation(tx)
    return tx if tx.to_i <= 0
    vd = (self.expired_at - Date.today).to_i
    self.net_value - (self.net_value * vd * tx / (100 * DAYS_AVG))
  end
end
