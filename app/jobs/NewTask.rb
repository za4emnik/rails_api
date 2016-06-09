class NewTask
  @queue = :new_task

  def self.perform(id)
    Task.update_status id, 'in_process'

    #
    #send to sinatra service
    #
    
  end
end
