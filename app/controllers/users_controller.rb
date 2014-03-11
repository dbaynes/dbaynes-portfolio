class UsersController < ApplicationController
  def new
    logger.info("@@@@@User New")
    @user = User.new
  end
  
  def create
    
    @user = User.new(user_params)
    logger.info("@@@@@User Create: #{@user}")
    if @user.save
      redirect_to root_url, notice: "Thank you for signing up!"
    else
      render "new"
    end
  end
  #def show
  #  #@user = User.new
  #  #render "new"
  #end
  
  private
  def user_params
    logger.info("@@@@@@@User Params!")
    params.require(:user).permit(:email, :password, :password_confirmation, :encrypted_password)
  end
  
end
