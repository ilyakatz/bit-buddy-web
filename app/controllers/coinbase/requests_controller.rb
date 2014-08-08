module Coinbase
  class RequestsController < ApplicationController
    before_action :authenticate_user!

    def new
      @accounts = coinbase.accounts["accounts"]
    end

    def create
      wallet_id = params[:id]
      request_str = "/accounts/#{wallet_id}/primary"
      Rails.logger.info request_str
      coinbase.post(request_str)

      @wallet = coinbase_wallet
      @wallet_name = coinbase_primary_account["name"]

      @new_address  = address(@wallet)

    end

    def callback_url
      blockchain_index_url(host: BitBuddy::Application.config.host)
    end

    def address(wallet)
      if params[:anonymous]
        #new_address = BlockchainAPI.new.new_address(wallet, callback_url)
        new_address = "1ExGKUzYYLohb5Qr3xTBrQDa3no2jHXfEL"
      else
        wallet
      end
    end
  end
end
