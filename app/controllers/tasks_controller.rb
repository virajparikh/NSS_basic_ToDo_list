class TasksController < ApplicationController
	
  def index
    @tasks = Task.all
  end

  def new 
    @task = Task.new
  end

  def create
    @task = Task.create( params[:post] )
    flash[:notice] = "Your task has been created"
    redirect_to :root
  end
end
