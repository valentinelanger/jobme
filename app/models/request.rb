class Request < ApplicationRecord
  belongs_to :job
  has_many :messages
  belongs_to :destinator, class_name: 'User'
  belongs_to :creator, class_name: 'User'

  validates :start_at, presence: true
  validates :end_at, presence: true
  validates :job_id, presence: true
end
