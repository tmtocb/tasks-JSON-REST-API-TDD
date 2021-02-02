require 'rails_helper'

RSpec.describe Point, type: :model do
  describe '#columns' do
    it { is_expected.to have_db_column(:name) }
    it { is_expected.to have_db_column(:done) }
    it { is_expected.to have_db_column(:task_id) }
  end
end
