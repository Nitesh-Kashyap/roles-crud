class ProjectsController < ApplicationController
  before_action :current_project, only: [:show, :edit, :update, :destroy]



  def index
    @projects = Project.all
  end

  def show
    #@project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.create(project_params)
    redirect_to projects_path
  end

  def edit
    #@project = Project.find(params[:id])
  end

  def update
    authorize @project
    #@project = Project.find(params[:id])
    @project.update(project_params)
    redirect_to projects_path
  end

  def destroy
    #@project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path
  end

  private

  def current_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name)
  end
end
