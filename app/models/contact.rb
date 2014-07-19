class Contact < ActiveRecord::Base
  belongs_to :user

  validates :user_id, presence: true
  validates :email, presence: true
  validates :wallet, presence: true
end
