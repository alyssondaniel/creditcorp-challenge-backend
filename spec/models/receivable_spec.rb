require 'rails_helper'

RSpec.describe Receivable, type: :model do
  subject { create(:receivable) }

  it { should validate_presence_of(:expired_at) }
  it { should validate_presence_of(:key) }

  context 'Uniqueness' do
    it { should validate_uniqueness_of(:key).case_insensitive }
  end

  describe 'Associations' do
    it { should belong_to(:company).class_name('Company') }
  end

  describe "Calculation" do
    it "Match Anticipation" do
      tx = 1.2
      days = (subject.expired_at - Date.today).to_i
      calc = subject.net_value - (subject.net_value * days * tx / (100 * Receivable::DAYS_AVG))

      subject.calc_antecipation(tx)

      expect(subject.calc_antecipation(1.2)).to eq(calc)
    end
  end
end
