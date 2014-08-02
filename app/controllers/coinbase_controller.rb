class CoinbaseController < ApplicationController
      <%= f.input :address, label: "What is your public Bitcoin address"%>
  before_action :authenticate_user!

  def info
    @balance = coinbase.balance

    current_user.update_credentials!(coinbase.credentials)
  end

end
