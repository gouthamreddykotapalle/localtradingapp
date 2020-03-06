class User < ApplicationRecord
  validates_presence_of :email

  def self.authenticate(email, password)
    user = User.find_by_email email
    if user == nil
      raise ArgumentError.new "email does not exist"
    elsif user.password != password
      raise ArgumentError.new "password is incorrect"
    else
      return user
    end
  end


end
