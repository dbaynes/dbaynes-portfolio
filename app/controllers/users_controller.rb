class UsersController < ApplicationController
  def new
    logger.info("@@@@@User New")
    @user = User.new
  end
  
  def create
    logger.info("@@@@@User Create Role: #{@user}")
    @user = User.new(user_params)
    logger.info("@@@@@User_params: #{params[:user][:email]}")
    logger.info("@@@@@Role param : #{params[:role]}")
    logger.info("@@@@@User.email: #{@user.email}")
    @user.role = params[:role]
    logger.info("@@@@@User.role: #{@user.role}")
    if @user.save
      flash[:success] = "Thank you for signing up!"
      redirect_to root_url, notice: "Thank you for signing up!"
    else
      logger.info("@@@@@User not Saved!")
      render "new"
    end
  end
  #def show
  #  #@user = User.new
  #  #render "new"
  #end
  
  private
  def user_params
    params.require(:user).permit(:email, :role, :password, :password_confirmation, :encrypted_password)
  end
  
end
