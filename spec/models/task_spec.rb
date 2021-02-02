require 'rails_helper'

RSpec.describe Task, type: :model do

  describe '#columns' do
    it { is_expected.to have_db_column(:title) }
    it { is_expected.to have_db_column(:created_by) }
  end

  describe '#validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:created_by) }
  end

  describe '#associations' do
    it { should have_many(:points).dependent(:destroy) }
  end
end
