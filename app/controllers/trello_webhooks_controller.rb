class TrelloWebhooksController < ActionController::Base
  include TrelloWebhook::Processor

  skip_before_action :verify_authenticity_token

  def update_card(payload)
    # binding.pry
    puts "Payload is triggered by '#update_card' =>"
    p payload
    #TODO: Depending on the card List, update task current_status
    # ["Done", "To deploy", "Waiting for client", "To review/debug", "In progress", "To do", "Sprint"]
    # Si la card est bougée "action_"
  end

  def create_card(payload)
    # binding.pry
    puts "Payload is triggered by '#create_card' =>"
    p payload

    list_name    = payload['action']['data']['list']['name']
    list_id      = payload['action']['data']['list']['id']
    card_name    = payload['action']['data']['card']['name']
    card_id      = payload['action']['data']['card']['id']
    short_link   = payload['action']['data']['card']['shortLink']

    if list_name == 'To Do'
      # task.new(user_story_id: , weight: , title: , current_status: 'To do', trello_card_id: )
      Task.create!(title: card_name, current_status: 'To do', trello_card_id: card_id)
    elsif list_name.split(' ').include?('Sprint')
      # UserStory.create(sprint_id: , done: false, title: ,trello_card_id: , trello_card_short_link:)
      sprint = Sprint.where(trello_list_id: list_id)
      UserStory.create(sprint: sprint, title: card_name ,trello_card_id: card_id, trello_card_short_link: shortLink)
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
    user_story_short_link   = payload['action']['data']['card']['attachment']['url'].split('/')[-2]
    p "short link is #{user_story_short_link}"

    task       = Task.where(trello_card_id: task_card_id).first
    user_story = UserStory.where(short_link: user_story_short_link).first
    task.update(user_story: user_story)
  end

  def update_list(payload)
    puts "Payload is triggered by '#update_list' =>"
    p payload
  end

  def add_label_to_card(payload)
    puts "Payload is triggered by '#add_label_to_card' =>"
    p payload
  end

  def remove_label_from_card(payload)
    puts "Payload is triggered by '#remove_label_from_card' =>"
    p payload
  end

  def webhook_secret
    ENV['TRELLO_TOKEN']  # From https://trello.com/app-key
  end
end
