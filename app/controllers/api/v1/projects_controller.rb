class Api::V1::ProjectsController < ApplicationController
	def index
		@project=Project.all
		render json: @project
	end
	def create
		@project = Project.find(project_params)
		if @project.save
			render json: @project
		else
			render json: {errors: @project.errors.full_meassages,notice: "validation failed"}
		end
	end
	def show
		@project =Project.find(params[id])
		render json: @project
	end
	def update
		@project= Project.find(params[:id])
		if @project.update_attributes(project_params)
			render json:{notice: "Succeessfully updated" ,project:@project}
		else
			render json: {errors: @project.errors.full_messsages,
								notice:"errors in validation"}
		end
	end
	def destroy
		@project =Project.find(params[:id])
		 @project.destroy
			render json:{notice:"Succeessfully deleted the record",project:{id:project.id,name:project.name}}
	end
	private
	def project_params
		params[:project].permit(:name,:client_id,:start_date,:status)
	end
end
