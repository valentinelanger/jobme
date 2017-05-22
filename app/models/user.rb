class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :received_reviews, class_name: 'Review', foreign_key: 'destinator_id'
  has_many :sent_reviews, class_name: 'Review', foreign_key: 'creator_id'
  has_many :received_messages, class_name: 'Message', foreign_key: 'destinator_id'
  has_many :sent_messages, class_name: 'Message', foreign_key: 'creator_id'
  has_many :requests
  has_many :received_requests, class_name: 'Request', through: :jobs

  validates :sexe, inclusion: { in: ['man', 'woman'], allow_nil: false }
  validates :first_name, presence: true
  validates :last_name, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
