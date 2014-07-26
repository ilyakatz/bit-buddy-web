class CoinbaseController < ApplicationController
  before_action :authenticate_user!

  def info
    @balance = coinbase.balance

    current_user.update_credentials!(coinbase.credentials)
  end

end
