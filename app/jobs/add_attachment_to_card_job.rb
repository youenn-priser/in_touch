class AddAttachmentToCardJob < ApplicationJob
  queue_as :webhook

  def perform(task_card_name, task_card_id, user_story_short_link)
    # Do something later
    task       = Task.find_by(trello_card_id: task_card_id)
    user_story = UserStory.find_by(trello_card_short_link: user_story_short_link)
    task.update(user_story: user_story)
    UpdateUserStoryStatusService.new(user_story).call
    UpdateSprintStatusService.new(user_story.sprint).call
  end
end
