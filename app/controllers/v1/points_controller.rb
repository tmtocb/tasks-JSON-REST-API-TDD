module V1
  class PointsController < ApplicationController
    before_action :set_task
    before_action :set_task_point, only: [:show, :update, :destroy]

    def index
      json_response(@task.points)
    end

    def show
      json_response(@point)
    end

    def create
      @task.points.create!(point_params)
      json_response(@task, :created)
    end

    def update
      @point.update(point_params)
      head :no_content
    end

    def destroy
      @point.destroy
      head :no_content
    end

    private

    def point_params
      params.permit(:name, :done)
    end

    def set_task
      @task = Task.find(params[:task_id])
    end

    def set_task_point
      @point = @task.points.find_by!(id: params[:id]) if @task
    end
  end       
end