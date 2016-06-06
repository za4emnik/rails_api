class Api::TasksController < Api::BaseController
  before_action :find_task, only: [:show, :update, :destroy]

  def index
    render_response @user.tasks
  end

  def show
    render_response @task
  end

  def create
    task = @user.tasks.create! task_params
    render_response task
  end

  def update
    @task.update! task_params
    render_response @task
  end

  def destroy
    @task.destroy!
    render_response nil, 204
  end

  private

  def task_params
    params.permit(:task_type, :params, :image_id)
  end

  def find_task
    @task = Task.find(params[:id])
  end

end
