class Task < ApplicationRecord
  has_many :points, dependent: :destroy
  validates_presence_of :title, :created_by
end
