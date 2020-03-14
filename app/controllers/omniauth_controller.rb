class OmniauthController < ApplicationController

    before_action :auth_with_social_networks, only: %i[facebook github google_oauth2]

  def facebook
  end

  def github
  end

  def google_oauth2
  end

  def failure
    auth_fail
  end

  private

  def auth_with_social_networks
    @user = User.create_form_provider_data(request.env['omniauth.auth'])

    if @user.persisted?
      sign_in_and_redirect @user
    else
      auth_fail
    end
  end

  def auth_fail
    flash[:error] = 'There was a problem signing you in. Please register or try signing in later.'
    redirect_to new_user_registration_url
  end
end
