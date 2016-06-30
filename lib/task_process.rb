class TaskProcess
 include HTTParty
 require 'resque-scheduler'

  def process(remote_id, task_id)
    response = HTTParty.get("http://localhost:9292/get_task/#{remote_id}")
    if response.code == 200
      body = JSON.parse(response.body)
      track_status(body, task_id)
    else
      task.update!(status: 'error_track_task')
    end
  end

  private
  def track_status(body, task_id)
    if body['status'] == 'done'
      task = Task.find task_id
      task.save_result body['image']['url']
    else
      Resque.enqueue_at(3.seconds.from_now, TrackTask, body['_id']['$oid'], task_id)
    end
  end
end
