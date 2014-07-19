class CoinbaseController < ApplicationController
  before_action :authenticate_user!

  def info
    coinbase = Coinbase::OAuthClient.new(Figaro.env.COINBASE_CLIENT_ID, Figaro.env.COINBASE_CLIENT_SECRET, current_user.credentials)

    @balance = coinbase.balance

    current_user.update_credentials!(coinbase.credentials)
  end

end
