class BlockchainController < ApplicationController
  def index
    value = params[:value].to_f
    value = value/100000000
    input_address= params[:input_address]
    destination_address = params[:destination_address]

    Rails.logger.info "Value: #{value}BTC"
    Rails.logger.info "Input address: #{input_address}"
    Rails.logger.info "Destination address: #{destination_address}"

    render json: "*ok*"
  end
end
