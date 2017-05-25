class Review < ApplicationRecord
  belongs_to :job
  belongs_to :creator, class_name: 'User'
  belongs_to :destinator, class_name: 'User'

  validates :rating, inclusion: { in: [1, 2, 3, 4, 5], allow_nil: false }
  validates :creator, presence: true
  validates :destinator, presence: true
  validates :job_id, presence: true

  def self.average_rating(job)
    @reviews = job.reviews
    unless @reviews.size == 0
      total = @reviews.reduce(0) do |total, review|
        total += review.rating.to_f
      end
      (total / @reviews.size).round
    end
  end
end
