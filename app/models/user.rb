class User < ApplicationRecord

  # validates :full_name, presence: true
  validates :email, presence: true
  # validates :encrypted_password,
  #           presence: true, confirmation: true, length: {minimum: 6},
  #           on: :create
  # validates :encrypted_password, confirmation: true,
  #           length: {minimum: 6},
  #           on: :update

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable,
  :omniauthable, omniauth_providers: [:facebook]

  has_and_belongs_to_many :events
  has_many :created_events, class_name: Event, foreign_key: 'presenter_id'
  has_many :participated_events, class_name: Event, through: :events, source: :users

  has_many :questions

  def self.find_for_facebook_oauth(auth)
    user_params = auth.slice(:provider, :uid)
    user_params.merge! auth.info.slice(:email)
    user_params[:full_name] = "#{auth.info.first_name} #{auth.info.last_name}"
    user_params[:facebook_picture_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    user_params = user_params.to_h

    user = User.find_by(provider: auth.provider, uid: auth.uid)
    user ||= User.find_by(email: auth.info.email) # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save
    end

    return user
  end

end
