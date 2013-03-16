class ClientsController < ApplicationController
	before_filter :signed_in_user
	before_filter :correct_user, only: [:destroy, :paid]

	def index
		
	end

	def create
		@client = current_user.clients.build(params[:client])
		if @client.save
			flash[:success] = "Client created"
			redirect_to root_url
		else
			@feed_items = []
			render 'static_pages/home'
		end
	end

	def destroy
		@client.destroy
		redirect_to root_url
		
	end

	def paid
		@client = current_user.clients.find_by_id(params[:id])
		@client.toggle!(:paid)
		flash[:success] = "Job marked as paid  " +  @client.paid.inspect
		redirect_to root_url
	end

	def reminder
		@client = current_user.clients.find_by_id(params[:id])
		if @client.update_attribute("reminder","daily")
			flash[:success] = "Reminder Set"
			redirect_to root_url
		else
			flash[:error] = "Not set"
			redirect_to root_url
		end
	end


	private

def correct_user
	@client = current_user.clients.find_by_id(params[:id])
	redirect_to root_url if @client.nil?
	
end

end