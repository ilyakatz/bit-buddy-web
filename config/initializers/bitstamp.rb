Bitstamp.setup do |config|
  config.key = Figaro.env.BITSTAMP_KEY
  config.secret = Figaro.env.BITSTAMP_SECRET
  config.client_id = Figaro.env.BITSTAMP_CLIENT_ID
end
