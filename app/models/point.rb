class Point < ApplicationRecord
  belongs_to :task
  validates_presence_of :name
end
