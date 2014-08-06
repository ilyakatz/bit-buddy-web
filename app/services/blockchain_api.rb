class BlockchainAPI

  def new_address(wallet, callback_url)
    response = RestClient.get 'https://blockchain.info/api/receive', {
      params: {
        method: "create",
        address: wallet,
        callback: callback_url
      }
    }
    Rails.logger.info response
    response

    json = JSON.parse(response)
    json["input_address"]
  end
end
