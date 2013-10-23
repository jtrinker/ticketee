class TicketsController < ApplicationController
	# bc tickets are a nested resourcse we have to set the project that the ticket belongs to
	before_action :set_project
	# :set_ticket finds the associated ticket within the scope of the project so we
	# we don't have to do @ticket = @project.tickets... for all the actions
	before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
  	@ticket = @project.tickets.build
  end

  def create
  	@ticket = @project.tickets.build(ticket_params)
  	if @ticket.save
  		flash[:notice] = "Ticket has been created."
  		redirect_to project_ticket_path(@project, @ticket)
  	else
  		flash[:alert] = "Ticket was not created."
  		render "new"
  	end
  end

  def show
  end

  def edit
  end

  def update
    if @ticket.update(ticket_params)
      flash[:notice] = "Ticket has been updated."
      redirect_to [@project, @ticket]
    else
      flash[:alert] = "Ticket has not been updated."
      render "edit"
    end
  end

  private

  	def ticket_params
  		params.require(:ticket).permit(:title, :description)
  	end

  	def set_project
  		# we're using params[:project_id] bc since we are in the TicketsController, params[:id] is
  		# referring to the id of the ticket.
  		@project = Project.find(params[:project_id])
  	end

  	def set_ticket
  		@ticket = @project.tickets.find(params[:id])
  	end
end
