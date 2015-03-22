class UsersController < ApplicationController
  before_action :signed_in_user, only: [:show]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to MailTailor!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    redirect_to root_path unless current_user?(@user)

    @senders = @user.letters.map { |letter| letter.sender }.uniq
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :mtname)
  end
end
