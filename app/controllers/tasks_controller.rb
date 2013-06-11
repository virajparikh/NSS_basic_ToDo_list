class TasksController < ApplicationController

  # before_filter :find_list

  def create
    # @list = List.find( params[:list] )
    task = Task.new(params[:task])
    # ListTask.create(list_id: params[:task][:list].to_i, task_id: Task.last.id)
    if task.save
      # Task.create(list_id: params[:task][:list].to_i, task_id: Task.last.id)
      flash[:notice] = "Your task has been added!"
      redirect_to :root
    else
      flash[:notice] = "Sorry, your task was not added."
      redirect_to :root
    end
  end

  def edit
    @task = Task.find( params[:id] )
  end

  def update
    @task = Task.find ( params[:id] )
    if @task.update_attributes( params[:task] )
      redirect_to :root
    else
      render 'edit'
    end
  end

  def destroy
    @task = Task.find( params[:id] )
    @task.destroy
    redirect_to :root
  end

  # private

  # # def find_list
  # #   @list = List.find(params[:id])
  # # end

end
