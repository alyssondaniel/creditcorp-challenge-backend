class Company < ApplicationRecord
  validates :name, :document, presence: true
  validates_uniqueness_of :document, case_sensitive: false
end
