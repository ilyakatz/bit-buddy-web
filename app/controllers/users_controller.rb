class UsersController < ApplicationController

  def signin
    redirect_to user_omniauth_authorize_path(:coinbase)
  end

end
