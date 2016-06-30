class TrackTask
   @queue = :track_task

  def self.perform(remote_id, task_id)
    track = TaskProcess.new
    track.process remote_id, task_id
  end
end
