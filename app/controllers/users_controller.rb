class UsersController < ApplicationController
  def new
    logger.info("@@@@@User New")
    @user = User.new
  end
  def edit
    logger.info("@@@@@User Edit")
     @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_path, notice: 'User was successfully updated.'
    end
  end
  
  def create
    logger.info("@@@@@User Create Role: #{@user}")
    @user = User.new(user_params)
    logger.info("@@@@@User_params: #{params[:user][:email]}")
    logger.info("@@@@@Role param : #{params[:role]}")
    logger.info("@@@@@User.email: #{@user.email}")
    logger.info("@@@@@User.Username: #{@user.username}")
    logger.info("@@@@@Params.Username: #{params[:username]}")
    @user.role = params[:role]
    logger.info("@@@@@User.role: #{@user.role}")
    if @user.save
      flash[:success] = "Thank you for signing up! Please log in now."
      #@user.email = " "
      #@user.password = " "
      #redirect_to root_url #, notice: "Thank you for signing up!"
      redirect_to new_user_session_path
    else
      logger.info("@@@@@User not Saved!")
      render "new"
    end
  end
  def show
    @user = User.new
    render "new"
  end
  def index
    @users = User.all
  end
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, notice: 'User was successfully destroyed.'
  end
  
  
  private
  def user_params
    params.require(:user).permit(:username, :email, :role, :password, :password_confirmation, :encrypted_password)
  end
  
end
