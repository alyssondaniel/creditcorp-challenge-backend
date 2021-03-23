require 'rails_helper'

RSpec.describe Receivable, type: :model do
  it { should validate_presence_of(:expired_at) }
  it { should validate_presence_of(:key) }
  context 'Uniqueness' do
    subject { create(:receivable) }
    it { should validate_uniqueness_of(:key).case_insensitive }
  end

  describe 'Associations' do
    it { should belong_to(:company).class_name('Company') }
  end
end
