class AddLabelToCardJob < ApplicationJob
  queue_as :webhook

  def perform(card_id, label_name)
    # Do something later
    if label_name == "weight 1"
      task = Task.find_by(trello_card_id: card_id)
      task.update(weight: 1)
    elsif label_name == "weight 2"
      task = Task.find_by(trello_card_id: card_id)
      task.update(weight: 3)
    elsif label_name == "weight 3"
      task = Task.find_by(trello_card_id: card_id)
      task.update(weight: 5)
    end
  end
end
