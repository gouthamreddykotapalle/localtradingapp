class UserController < ActionController::Base

  def user_params
    params.require(:users).permit(:account, :password, :name, :email, :phone)
  end

  def register
    @user = User.create!(user_params)
  end
end
