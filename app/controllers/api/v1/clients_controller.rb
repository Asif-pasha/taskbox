class Api::V1::ClientsController < ApplicationController
	def index
	  	@clients=Client.all
	  	render json: @clients
	end
	def create
	  	@client = Client.new (client_params)
		  	if @client.save
		  	render json: @client #single object return as hash (json)
		  	else
		  	render json: {errors: @client.errors.full_messages, reason: "validations failed"}
		  	# error in sacing must return as hash
		  	end
  	end
  	def show
  		@client=Client.find(params[:id])
  		#if @client.empty?
  		#render json: { Reason: "No clients found" }
  		#else
  		render json: @client
  		#end
  	end	
  	def destroy
  		@client =Client.find(params[:id])
  		@client.destroy
  		render json: {notice: "Successfully deleted the client",
  						client: {id:@client.id,name:@client.name}}
  	end
  	def update
  		@client =Client.find(params[:id])
  		if @client.update_attributes(client_params)
  		render json: { notice: "Suceesfully updated",client:@client}
  		else
  		render json:{errors: @client.errors.full_messages,reason: "validations failed"}
  	 end
    end
  	private
   	def client_params
   	params[:client].permit(:name,:email,:company)
   	end
end