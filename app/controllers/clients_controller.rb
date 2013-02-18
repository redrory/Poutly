class ClientsController < ApplicationController
	before_filter :signed_in_user
	before_filter :correct_user, only: :destroy

	def index
		
	end

	def create
		@client = current_user.clients.build(params[:client])
		if @client.save
			flash[:sucess] = "Client created"
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


	private

def correct_user
	@client = current_user.clients.find_by_id(params[:id])
	redirect_to root_url if @client.nil?
	
end

end