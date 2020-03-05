class User < ApplicationRecord
  validates validates_presence_of :email
end
