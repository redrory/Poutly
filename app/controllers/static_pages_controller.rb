class StaticPagesController < ApplicationController
  def home
    if signed_in?
       @client = current_user.clients.build
       @feed_items = current_user.feed.paginate(page: params[:page])
    end
   
  end

  def show
    @client = current_user.clients.build
    @feed_items = current_user.feed.paginate(page: params[:page])
  end

  def help
  end

  def about
  	
  end

  def contact
  	
  end
end
