module V1
  class TasksController < ApplicationController
    before_action :set_task, only: [:show, :update, :destroy]

    def index
      @tasks = current_user.tasks.paginate(page: params[:page], per_page: 10)
      json_response(@tasks)
    end

    def create
      @task = current_user.tasks.create!(task_params)
      json_response(@task, :created)
    end

    def show
      json_response(@task)
    end

    def update
      @task.update(task_params)
      head :no_content
    end

    def destroy
      @task.destroy
      head :no_content
    end

    private

    def task_params
      params.permit(:title)
    end

    def set_task
      @task = Task.find(params[:id])
    end
  end
end

