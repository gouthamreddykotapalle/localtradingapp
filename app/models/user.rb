class User < ActiveRecord::Base
  validates :account, uniqueness: true
  validates :email, uniqueness: true
end