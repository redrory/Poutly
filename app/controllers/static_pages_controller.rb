class StaticPagesController < ApplicationController
  def home
    if signed_in?
       @client = current_user.clients.build
       #@feed_items = current_user.feed.paginate(page: params[:page])
       @feed_items = current_user.feed.find_all_by_paid(false)
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
