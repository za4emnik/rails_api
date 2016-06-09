class DoneTask
  @queue = :done_task

  def self.perform(task)
    sleep(10)
  end
end
