class TasksController < ApplicationController
  def create
  	@task = Task.new(task_params)
  	@task.save!
  end

  def update
  	@task = Task.find(params[:id])
  	if @task.update(task_params)
  		redirect_to @task
  	else	
  		render 'edit'
  	end	
  end

  def delete
  	@task = Task.find(params[:id])
  	@task.destroy
  	redirect_to task_path
  end

  def index
  	@task = Task.all
  end

  def new
  	@task = Task.new  	
  end

  private
  def task_params
  	params.require(:task).permit(:title,:content,:time)
  end	
end
