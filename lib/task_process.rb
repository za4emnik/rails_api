class TaskProcess
 include HTTParty

  def process(task)
    task = Task.find task
    image = Image.find task.image_id
    opt = {"task"=>task.task_type,"params"=>task.params,"image"=>"http://localhost:3000/#{image.image}"}
    response = HTTParty.post("http://localhost:9292/load", query: opt)
    task.update!(status: 'pending')
    parse_body response, task
  end

  private

    def parse_body(response, task)
      body = JSON.parse(response.body)
      if response.code == 200
        track_status(body, task)
      else
        task.update!(status: 'error')
      end
    end

    def track_status(body, task)
      if body['status'] == 'done'
        task.update!(status: 'done')
        task.save_result body['image']
      else
        sleep(2)
        #response = new_request body['_id']['$oid']
        response = new_request body['id']
        parse_body response, task
      end
    end

    def new_request (body_id)
      response = HTTParty.get("http://localhost:9292/get_task/#{body_id}")
    end
end
