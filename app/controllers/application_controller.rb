class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def coinbase
    coinbase = Coinbase::OAuthClient.new(
      Figaro.env.COINBASE_CLIENT_ID,
      Figaro.env.COINBASE_CLIENT_SECRET, current_user.credentials)

    current_user.update_credentials!(coinbase.credentials)
  end

  def coinbase_wallet
    response = coinbase.get("/account/receive_address")
    response["address"]
  end

  def coinbase_primary_account
    coinbase.accounts["accounts"].select{|account| account["primary"]}.first
  end

  def coinbase_primary_account_name
    coinbase_primary_account["name"]
  end
  rescue_from OAuth2::Error do |exception|

    if exception.code == "invalid_request"
      sign_out(:user)
      authenticate_user!
    end
  end

end
