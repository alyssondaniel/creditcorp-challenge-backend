require 'rails_helper'

RSpec.describe Company, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:document) }
    context 'Uniqueness' do
      subject { create(:company) }
      it { should validate_uniqueness_of(:document).case_insensitive }
    end
  end

  describe 'Associations' do
    it { should have_many(:receivables).class_name('Receivable') }
  end
end
