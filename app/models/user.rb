class User < ApplicationRecord
  validates :account, uniqueness: true
  validates :email, uniqueness: true
end
