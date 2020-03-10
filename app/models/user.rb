class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable,

  devise :omniauthable, omniauth_providers: %i[trello]

    def self.find_for_trello_oauth(auth)
      user_params = auth.slice('provider', 'uid')
      user_params.merge! auth.info.slice('email', 'name')
      user_params[:avatar_url] = auth.dig('extra', 'raw_info', 'avatarUrl').present? ? auth.dig('extra', 'raw_info', 'avatarUrl') + '/170.png' : 'default-profile-picture.png'
      user_params[:profile_url] = auth.info.dig('urls', 'profile')
      user_params[:username] = auth.info['nickname']
      user_params[:token] = auth.credentials.token
      user_params = user_params.to_h

      user = User.find_by(provider: auth.provider, uid: auth.uid)
      user ||= User.find_by(email: auth.info.email) # User did a regular sign up in the past.
      if user
        user.update(user_params)
      else
        user = User.new(user_params)
        user.encrypted_password = Devise.friendly_token[0,20]  # Fake password for validation
        user.save
      end

      return user
    end
end
