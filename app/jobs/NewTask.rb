class NewTask
   include HTTParty
   @queue = :new_task
   base_uri "http://localhost:9292"

  def self.perform(id)
    task = Task.find id
    image = Image.find task.image_id
    opt = {"task"=>task.task_type,"params"=>task.params,"image"=>"http://localhost:3000/#{image.image}"}
    response = HTTParty.post("http://localhost:9292/load", query: opt)
    task.update!(status: 'pending')

    if response.code == 200
      body = JSON.parse(response.body)
      Resque.enqueue_at(3.seconds.from_now, TrackTask, body['_id']['$oid'], task.id)
    else
      task.update!(status: 'error_remote_server')
    end
  end
end
