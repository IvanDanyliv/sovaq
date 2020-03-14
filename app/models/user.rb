class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :github, :google_oauth2]


  validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}

  validates :password, presence: true,
            confirmation: true,
            length: {within: 6..40},
            on: :create

  validates :password, confirmation: true,
            length: {within: 6..40},
            allow_blank: true,
            on: :update


  def self.create_form_provider_data(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do |user|
      user.email = provider_data.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end
end
