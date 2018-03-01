class ClientsController < ApplicationController
  def index
  	@clients =Client.all
  	respond_to do |format|
  		format.json {render json: @clients}
  		format.html
  	end
  end
end
