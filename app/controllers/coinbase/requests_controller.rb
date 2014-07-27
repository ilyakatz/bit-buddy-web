module Coinbase
  class RequestsController < ApplicationController
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
      @wallet_balance = coinbase_primary_account["balance"]

      response = RestClient.get 'https://blockchain.info/api/receive', {
        params: {
          method: "create",
          address: @wallet,
          callback: "http://bitbuddy.t.proxylocal.com/blockchain"
        }
      }
      Rails.logger.info response

      json = JSON.parse(response)
      @new_wallet = json["input_address"]

      @qr = RQRCode::QRCode.new(@new_wallet)

    end
  end
end
