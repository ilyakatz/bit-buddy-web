class PaymentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @contact = current_user.contacts.find(params[:contact_id])
  end

  def create
    @contact = current_user.contacts.find(params[:contact_id])
    @payment_amount = params[:payment][:amount]
    @coinbase = coinbase
    wallet = @contact.wallet

    @transaction = coinbase.send_money wallet, @payment_amount, "sending money through api"
  end
end
