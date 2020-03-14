class CreateCardJob < ApplicationJob
  queue_as :webhook

  def perform(list_name, list_id, card_name, card_id, short_link)
    if list_name == 'to do'
      # task.new(user_story_id: , weight: , title: , current_status: 'To do', trello_card_id: )
      Task.create!(title: card_name, current_status: 'to do', trello_card_id: card_id)
    elsif list_name.split(' ').include?('sprint')
      # UserStory.create(sprint_id: , done: false, title: ,trello_card_id: , trello_card_short_link:)
      sprint = Sprint.find_by(trello_list_id: list_id)
      UserStory.create(sprint: sprint, title: card_name ,trello_card_id: card_id, trello_card_short_link: short_link)
    end
  end
end
