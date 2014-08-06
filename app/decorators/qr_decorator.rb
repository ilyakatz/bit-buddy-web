class QRDecorator

  def initialize(string)
    @string = string
  end

  def decorate
    RQRCode::QRCode.new(@string)
  end
end
