class Message < ApplicationRecord
  belongs_to :destinator, class_name: 'User'
  belongs_to :creator, class_name: 'User'
  belongs_to :job

  validates :content, presence: true
end
