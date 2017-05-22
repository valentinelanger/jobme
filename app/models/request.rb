class Request < ApplicationRecord
  belongs_to :user
  belongs_to :job
  belongs_to :pro, class_name: 'User', through: :jobs

  validates :start_at, presence: true
  validates :end_at, presence: true
  validates :user_id, presence: true
  validates :job_id, presence: true
  validates :pro, presence: true
end
