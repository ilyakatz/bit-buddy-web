require 'coinbase'

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def coinbase
    @user = User.find_for_oauth(request.env["omniauth.auth"])
    @user.update_credentials! (request.env["omniauth.auth"]["credentials"])

   if @user.persisted?
     sign_in_and_redirect @user, :event => :authentication
   else
     session["devise.omniauth_data"] = request.env["omniauth.auth"]
   end
  end

end
