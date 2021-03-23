class Company < ApplicationRecord
  has_many :receivables

  validates :name, :document, presence: true
  validates_uniqueness_of :document, case_sensitive: false
end
