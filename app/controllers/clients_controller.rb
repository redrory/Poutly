class ClientsController < ApplicationController
	before_filter :signed_in_user

	def index
		
	end

	def create
		@client = current_user.clients.build(params[:client])
		if @client.save
			flash[:sucess] = "Client created"
			redirect_to root_url
		else
			render 'static_pages/home'
		end
	end

	def destroy
		
	end
end