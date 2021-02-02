require 'rails_helper'

RSpec.describe Point, type: :model do

  describe '#columns' do
    it { is_expected.to have_db_column(:name) }
    it { is_expected.to have_db_column(:done) }
    it { is_expected.to have_db_column(:task_id) }
  end

  describe '#validations' do
    it { should validate_presence_of(:name) }
  end

  describe '#associations' do
    it { should belong_to(:task) }
  end
end
