class StaticPagesController < ApplicationController
  def home
    @client = current_user.clients.build if signed_in?
  end

  def help
  end

  def about
  	
  end

  def contact
  	
  end
end
