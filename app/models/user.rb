class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :received_reviews, class_name: 'Review', foreign_key: 'destinator_id'
  has_many :sent_reviews, class_name: 'Review', foreign_key: 'creator_id'
  has_many :received_messages, class_name: 'Message', foreign_key: 'destinator_id'
  has_many :sent_messages, class_name: 'Message', foreign_key: 'creator_id'
  has_many :requests
  has_many :received_requests, class_name: 'Request', through: :jobs

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
