class Admin::UsersController < ApplicationController
  
  before_filter :admin?

  def index
    @users = User.all.page(params[:page]).per(5)
  end

  def admin?
    if current_user.admin == false
      flash[:alert] = "You must be an admin!"
      redirect_to movies_path
    end
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
