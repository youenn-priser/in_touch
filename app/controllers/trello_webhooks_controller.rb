class TrelloWebhooksController < ActionController::Base
  include TrelloWebhook::Processor

  skip_before_action :verify_authenticity_token

  def create_card(payload)
    # binding.pry
    puts "Payload is triggered by '#create_card' =>"
    p payload

    list_name    = payload['action']['data']['list']['name'].downcase
    list_id      = payload['action']['data']['list']['id']
    card_name    = payload['action']['data']['card']['name']
    card_id      = payload['action']['data']['card']['id']
    short_link   = payload['action']['data']['card']['shortLink']

    CreateCardJob.perform_later(list_name, list_id, card_name, card_id, short_link)
    # TODO: Une card est créée:
    # - check si la card est créée dans une "list" sprint => User Story
  end

  def update_card(payload)
    puts "Payload is triggered by '#update_card' =>"
    p payload

    change       = payload['action']['display']['translationKey']
    card_id      = payload['action']['data']['card']['id']
    new_status = payload['action']['display']['entities']['listAfter']['text'].downcase
    #TODO: Depending on the card List, update task current_status
    # ["Done", "To deploy", "Waiting for client", "To review/debug", "In progress", "To do", "Sprint"]
    # Si la card est bougée "action_"
    UpdateCardJob.perform_later(change, card_id, new_status)
  end

  def add_attachment_to_card(payload)
    puts "Payload is triggered by '#add_attachment_to_card' =>"
    p payload
    task_card_name          = payload['action']['data']['card']['name']
    task_card_id            = payload['action']['data']['card']['id']
    user_story_short_link   = payload['action']['data']['attachment']['url'].split('/')[-2]

    AddAttachmentToCardJob.perform_later(task_card_name, task_card_id, user_story_short_link)
  end

  def add_label_to_card(payload)
    puts "Payload is triggered by '#add_label_to_card' =>"
    p payload

    card_id    = payload['action']['data']['card']['id']
    label_name = payload['action']['data']['label']['name']

    AddLabelToCardJob.perform_later(card_id, label_name)
  end
  ## Non-handled action at that time
  def delete_card(payload)
    puts "Payload is triggered by '#delete_card' =>"
    p payload
  end

  def update_list(payload)
    puts "Payload is triggered by '#update_list' =>"
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
