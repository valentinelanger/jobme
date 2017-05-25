class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  GENDERS = ['man', 'woman']
  has_many :received_reviews, class_name: 'Review', foreign_key: 'destinator_id'
  has_many :sent_reviews, class_name: 'Review', foreign_key: 'creator_id'
  has_many :received_messages, class_name: 'Message', foreign_key: 'destinator_id'
  has_many :sent_messages, class_name: 'Message', foreign_key: 'creator_id'
  has_many :jobs
  has_many :received_requests, class_name: 'Request', foreign_key: 'destinator_id'
  has_many :sent_requests, class_name: 'Request', foreign_key: 'creator_id'
  has_attachment :picture

  validates :sexe, inclusion: { in: GENDERS, allow_nil: true }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]

  FACEBOOK_GENDER = {
    'male' => 'man',
    'female' => 'woman'
  }

  def requests
    Request.where('creator_id = ? OR destinator_id = ?', id, id)
  end

  def self.find_for_facebook_oauth(auth)
    user_params = auth.slice(:provider, :uid)
    user_params.merge! auth.info.slice(:email, :first_name, :last_name)
    user_params[:facebook_picture_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    user_params = user_params.to_h
    user_params[:sexe] = FACEBOOK_GENDER[auth.extra.raw_info.gender]
    user = User.where(provider: auth.provider, uid: auth.uid).first
    user ||= User.where(email: auth.info.email).first # User did a regular sign up in the past.


    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.picture_url = auth.info.image.to_s
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save!
    end

    return user
  end
end
