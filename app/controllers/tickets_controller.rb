class TicketsController < ApplicationController
	# bc tickets are a nested resourcse we have to set the project that the ticket belongs to
	before_action :set_project

  def index
  end

  def new
  	@ticket = @project.tickets.build
  end

  def create
  end

  def show
  end

  private

  	def set_project
  		# we're using params[:project_id] bc since we are in the TicketsController, params[:id] is
  		# referring to the id of the ticket.
  		@project = Project.find(params[:project_id])
  	end
end
