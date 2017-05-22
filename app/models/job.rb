class Job < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :messages

  validates :category, inclusion: { in: %(gardener plumber electrician baby-sitter interior-designer), allow_nil: false }
  validates :title, presence: true
  validates :description, presence: true
end
