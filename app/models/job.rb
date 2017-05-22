class Job < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :messages

  validates :title, presence: true
  validates :description, presence: true
end
