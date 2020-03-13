class UserStoryProgressService
  def initialize(user_story)
    @user_story = user_story
    @tasks = @user_story.tasks
  end

  def call
    repartition = {}
    repartition[:done]               = @tasks.where(current_status: "done").count
    repartition[:to_deploy]          = @tasks.where(current_status: "to deploy").count
    repartition[:waiting_for_client] = @tasks.where(current_status: "waiting for client").count
    repartition[:to_review_debug]    = @tasks.where(current_status: "to review/debug").count
    repartition[:in_progress]        = @tasks.where(current_status: "in progress").count
    repartition[:to_do]              = @tasks.where(current_status: "to do").count
    repartition[:total_tasks]        = @tasks.count
    return repartition
  end

end

