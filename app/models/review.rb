class Review < ApplicationRecord
  belongs_to :job
  belongs_to :creator, class_name: 'User'
  belongs_to :destinator, class_name: 'User'

  validates :rating, inclusion: { in: %w(1 2 3 4 5), allow_nil: false }
  validates :creator, presence: true, uniqueness: true
  validates :destinator, presence: true, uniqueness: true
  validates :job_id, presence: true, uniqueness: true
end
