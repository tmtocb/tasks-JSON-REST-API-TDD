require 'rails_helper'

RSpec.describe User, type: :model do

  describe '#columns' do
    it { is_expected.to have_db_column(:name) }
    it { is_expected.to have_db_column(:email) }
    it { is_expected.to have_db_column(:password_digest) }
  end
end
