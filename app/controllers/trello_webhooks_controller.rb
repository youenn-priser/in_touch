class TrelloWebhooksController < ActionController::Base
  include TrelloWebhook::Processor

  skip_before_action :verify_authenticity_token

  def update_card(payload)
    # binding.pry

    puts "Payload is triggered by '#update_card' =>"
    p payload

    change       = payload['action']['display']['translationKey']
    p card_id      = payload['action']['data']['card']['id']
    p new_status = payload['action']['display']['entities']['listAfter']['text'].downcase
    #TODO: Depending on the card List, update task current_status
    # ["Done", "To deploy", "Waiting for client", "To review/debug", "In progress", "To do", "Sprint"]
    # Si la card est bougée "action_"
    if change == "action_move_card_from_list_to_list"
      targeted_task = Task.find_by(trello_card_id: card_id)
      p targeted_task
      targeted_task.update(current_status: new_status)
    end
  end

  def create_card(payload)
    # binding.pry
    puts "Payload is triggered by '#create_card' =>"
    p payload

    list_name    = payload['action']['data']['list']['name'].downcase
    list_id      = payload['action']['data']['list']['id']
    card_name    = payload['action']['data']['card']['name']
    card_id      = payload['action']['data']['card']['id']
    short_link   = payload['action']['data']['card']['shortLink']

    if list_name == 'to do'
      # task.new(user_story_id: , weight: , title: , current_status: 'To do', trello_card_id: )
      Task.create!(title: card_name, current_status: 'to do', trello_card_id: card_id)
    elsif list_name.split(' ').include?('sprint')
      # UserStory.create(sprint_id: , done: false, title: ,trello_card_id: , trello_card_short_link:)
      sprint = Sprint.find_by(trello_list_id: list_id)
      UserStory.create(sprint: sprint, title: card_name ,trello_card_id: card_id, trello_card_short_link: short_link)
    end
    # TODO: Une card est créée:
    # - check si la card est créée dans une "list" sprint => User Story

  end

  def delete_card(payload)
    puts "Payload is triggered by '#delete_card' =>"
    p payload
  end

  def add_attachment_to_card(payload)
    puts "Payload is triggered by '#add_attachment_to_card' =>"
    p payload
    task_card_name          = payload['action']['data']['card']['name']
    task_card_id            = payload['action']['data']['card']['id']
    user_story_short_link   = payload['action']['data']['attachment']['url'].split('/')[-2]
    p "short link is #{user_story_short_link}"

    task       = Task.find_by(trello_card_id: task_card_id)
    user_story = UserStory.find_by(trello_card_short_link: user_story_short_link)
    p user_story
    task.update(user_story: user_story)
  end

  def update_list(payload)
    puts "Payload is triggered by '#update_list' =>"
    p payload
  end

  def add_label_to_card(payload)
    puts "Payload is triggered by '#add_label_to_card' =>"
    p payload

    card_id    = payload['action']['data']['card']['id']
    label_name = payload['action']['data']['label']['name']


    if label_name == "weight 1"
      task = Task.find_by(trello_card_id: card_id)
      task.update(weight: 1)
    elsif label_name == "weight 3"
      task = Task.find_by(trello_card_id: card_id)
      task.update(weight: 3)
    elsif label_name == "weight 5"
      task = Task.find_by(trello_card_id: card_id)
      task.update(weight: 5)
    end

  end

  def remove_label_from_card(payload)
    puts "Payload is triggered by '#remove_label_from_card' =>"
    p payload
  end

  def webhook_secret
    ENV['TRELLO_TOKEN']  # From https://trello.com/app-key
  end
end
