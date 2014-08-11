class PaymentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @contact = current_user.contacts.find(params[:contact_id])
  end

  def create
    @contact = current_user.contacts.find(params[:contact_id])
    @payment_amount = Money.new(params[:payment][:amount].to_f*100000000, "BTC")
    @wallet_balance = Money.new(coinbase.balance, "BTC")
    wallet = @contact.wallet

    begin
    @transaction = coinbase.send_money wallet, @payment_amount, "sending money through api"
    rescue Coinbase::Client::Error => e
      flash[:alert] = e.message
      redirect_to action: :new
    end
  end
end
