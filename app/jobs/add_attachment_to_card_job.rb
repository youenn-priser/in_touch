class AddAttachmentToCardJob < ApplicationJob
  queue_as :webhook

  def perform(task_card_name, task_card_id, user_story_short_link)
    # Do something later
    user_story = UserStory.find_by(trello_card_short_link: user_story_short_link)
    if Task.exists?(trello_card_id: task_card_id)
      task = Task.find_by(trello_card_id: task_card_id)
      task.update(user_story: user_story)
    else
      Task.create!(title: task_card_name, current_status: 'to do', trello_card_id: task_card_id, user_story: user_story)
    end
    ProgressModule::UpdateUserStoryStatusService.new(user_story).call
    ProgressModule::UpdateSprintStatusService.new(user_story.sprint).call
  end
end
