class UpdateCardJob < ApplicationJob
  queue_as :webhook

  def perform(change, card_id, new_status)
    # Do something later
    if change == "action_move_card_from_list_to_list"
      targeted_task = Task.find_by(trello_card_id: card_id)
      targeted_task.update(current_status: new_status)
      UpdateUserStoryStatusService.new(targeted_task.user_story).call
      UpdateSprintStatusService.new(targeted_task.user_story.sprint).call
    end
  end
end
