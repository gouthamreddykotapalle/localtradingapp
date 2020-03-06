class User < ApplicationRecord
  validates_presence_of :email

  def authenticate(email, password) #self. is a class method
    user = User.find_by(email:email)
    if user && user.password == password
      user
    else
      nil
    end
  end


end
