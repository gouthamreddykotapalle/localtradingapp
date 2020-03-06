class User < ApplicationRecord
  validates_presence_of :email

  def self.authenticate(email, password)
    user = User.find_by_email email
    if user == nil
      flash[:notice] = "email does not exist"
      redirect_to "/login"
    elsif user.password != password
      flash[:notice] = "password is incorrect"
      redirect_to "/login"
    else
      return user
    end
  end


end
