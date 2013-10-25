class ProjectsController < ApplicationController
  before_action :authorize_admin!, only: [:new, :create, :edit, :update, :destroy]
  # redirects user if he lands on one of these actions for a project that doesn't exist
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      flash[:notice] = "Project has been created."
      redirect_to @project
    else
      flash[:alert] = "Project has not been created."

      render "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    @project.update(project_params)

    flash[:notice] = "Project has been updated."
    redirect_to @project
  end

  def destroy
    @project.destroy

    flash[:notice] = "Project has been destroyed."

    redirect_to projects_path
  end

  private

    def project_params
      params.require(:project).permit(:name, :description)
    end

    def set_project
      @project = Project.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "The project you were looking for could not be found."

      redirect_to projects_path
    end

end
