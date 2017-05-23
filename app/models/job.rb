class Job < ApplicationRecord
  CATEGORIES = %w(gardener plumber electrician baby-sitter interior-designer)
  belongs_to :user
  has_many :reviews
  has_many :messages

  validates :category, inclusion: { in: CATEGORIES, allow_nil: false }
  validates :title, presence: true
  validates :title, length: { maximum: 20 }
  validates :description, presence: true
end
