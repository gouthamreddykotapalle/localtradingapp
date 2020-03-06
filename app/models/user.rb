class User < ApplicationRecord
  validate validates_presence_of :email
end
