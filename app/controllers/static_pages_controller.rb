class StaticPagesController < ApplicationController

  before_filter :admin_user, only: [:destroy]
  def home
    if signed_in?
       @client = current_user.clients.build
       #@feed_items = current_user.feed.paginate(page: params[:page])
       @feed_items = current_user.feed.find_all_by_paid(false)
       @paid_items = current_user.feed.find_all_by_paid(true)
       @emails = current_user.feed.where(:last_email => nil)
       @sent_emails = current_user.feed.where(:email_sent => true)
       @all_jobs = current_user.feed
       @Rem = Rem.all
    end
    
  end

  def admin
    if you_admin?
      flash[:success] = "You're admin, you can see"
      @users = User.all
      @clients = Client.all
    else
      redirect_to(root_path)
      flash[:error] = "Not for your eyes, only admin :-)"
     end 
  end

  def show
    #@client = current_user.clients.build
    @Rem = Rem.all
    @client = Client.find(params[:id])
    @feed_items = current_user.feed.paginate(page: params[:page])
  end

  def email_sent
    @client = current_user.clients.build
   #@feed_items = current_user.feed.paginate(page: params[:page])
    @feed_items = current_user.feed.find_all_by_paid(true)
  end

  def help
  end

  def about
  	
  end

  def contact
  	
  end
end
