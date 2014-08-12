class CoinbaseController < ApplicationController
  before_action :authenticate_user!

  def info
    @balance = coinbase.balance
  end

end
