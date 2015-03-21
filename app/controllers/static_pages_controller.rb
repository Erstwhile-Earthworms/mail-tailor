class StaticPagesController < ApplicationController
  def home
    redirect_to(user_path(current_user)) if current_user
    @user = User.new
    # binding.pry
  end

end
