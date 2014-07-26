class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def coinbase
    coinbase = Coinbase::OAuthClient.new(
      Figaro.env.COINBASE_CLIENT_ID,
      Figaro.env.COINBASE_CLIENT_SECRET, current_user.credentials)
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
end
