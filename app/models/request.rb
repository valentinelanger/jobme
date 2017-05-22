class Request < ApplicationRecord
  belongs_to :user
  belongs_to :job
  belongs_to :pro, class_name: 'User', through: :jobs

end
