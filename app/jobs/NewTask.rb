class NewTask
   include HTTParty
   @queue = :new_task
   base_uri "http://localhost:9292"

  def self.perform(id)
    #Task.update_status id, 'in_process'
    #task = TaskProcess.new (task)
    processor = TaskProcess.new
    task = Task.find id
    processor.process(task)
  end
end
