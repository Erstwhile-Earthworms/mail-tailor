class StaticPagesController < ApplicationController
  def home
    @user = User.new
    # binding.pry
  end

end
