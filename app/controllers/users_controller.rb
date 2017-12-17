class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(set_params)
    if @user.save
        flash[:success] = "Welcome to the Sample Application"
        redirect_to user_url(@user)
    else
        render "new"
    end
  end

  private
      def set_params
        params.require(:user).permit(:name,:email,:password,:password_confirmation)
      end

end
