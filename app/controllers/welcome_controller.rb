class WelcomeController < ApplicationController

  def index
    @primary_account = coinbase_primary_account_name
    @transactions = coinbase.transactions["transactions"].collect{|t| t["transaction"]}
  end
end
