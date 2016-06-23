class Api::TasksController < Api::BaseController
  before_action :find_task, only: [:show, :update, :destroy]

  def index
    render_response @user.tasks.page params[:page]
  end

  def show
    render_response @task
  end

  def create
    Task.search_image params[:image_id]
    task = @user.tasks.create! task_params
    e = Resque.enqueue(NewTask, task.id)
    render_response task

  end

  def update
    Task.search_image params[:image_id]
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

  rescue_from ActiveRecord::RecordNotFound do |e|
    render_error({ 'message'=>'Image not found' }.to_json, 404)
  end
end
