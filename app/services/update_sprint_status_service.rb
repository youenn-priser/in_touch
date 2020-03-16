class UpdateSprintStatusService
  def initialize(sprint)
    @sprint = sprint
  end

  def call
    user_stories_to_do = @sprint.user_stories.select { |user_story| user_story.current_status == "to do" }
    user_stories_done = @sprint.user_stories.select { |user_story| user_story.current_status == "done" }

    if user_stories_to_do.count == @sprint.user_stories.count
      @sprint.update(current_status: "to do")
    elsif user_stories_done.count == @sprint.user_stories.count
      @sprint.update(current_status: "done")
    else
      @sprint.update(current_status: "in progress")
    end
  end
end
