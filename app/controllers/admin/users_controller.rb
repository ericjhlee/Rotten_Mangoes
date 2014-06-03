class Admin::UsersController < ApplicationController
  
  def index
    @user = User.all
  end

  # def create
  #   User.create(admin_user_params)
  # end

  # private

  # def admin_user_params
  #   params.require(:user).permit(
  #     :username, :password, :email, 
  #     :movies_attribute [:name, :studio]
  #   )
  # end

end
