require 'rails_helper'

RSpec.describe Task, type: :model do
  it { is_expected.to have_db_column(:title) }
  it { is_expected.to have_db_column(:created_by) }
end
