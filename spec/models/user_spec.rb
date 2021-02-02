require 'rails_helper'

RSpec.describe User, type: :model do

  describe '#columns' do
    it { is_expected.to have_db_column(:name) }
    it { is_expected.to have_db_column(:email) }
    it { is_expected.to have_db_column(:password_digest) }
  end

  describe '#validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
  end

  describe '#associations' do
    it { should have_many(:tasks) }
  end
end
