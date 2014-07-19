class PaymentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @contact = current_user.contacts.find(params[:contact_id])
  end

  def create
    @contact = current_user.contacts.find(params[:contact_id])
    @payment_amount = params[:payment][:amount]
    wallet = @contact.wallet
    binding.pry
    @coinbase = Coinbase::OAuthClient.new(Figaro.env.COINBASE_CLIENT_ID, Figaro.env.COINBASE_CLIENT_SECRET, current_user.credentials)

    #r = coinbase.send_money wallet, 0.01
  end
end
