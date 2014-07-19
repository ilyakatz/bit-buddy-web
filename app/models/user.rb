class User < ActiveRecord::Base
  devise :omniauthable, :rememberable, :trackable, :omniauth_providers => [:coinbase]
  serialize :credentials

  validates :uid, presence: true

  def self.find_for_oauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.name = auth.info.name
    end
  end

  def update_credentials!(credentials)
    self.credentials = credentials
    self.save
  end

end
