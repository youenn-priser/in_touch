class UpdateUserStoryStatusService
  def initialize(user_story)
    @user_story = user_story
  end

  def call
    tasks_to_do = @user_story.tasks.select { |task| task.current_status == "to do" }
    tasks_done = @user_story.tasks.select { |task| task.current_status == "done" }

    if tasks_to_do.count == @user_story.tasks.count
      @user_story.update(current_status: "to do")
    elsif tasks_done.count == @user_story.tasks.count
      @user_story.update(current_status: "done")
    else
      @user_story.update(current_status: "in progress")
    end
  end
end
