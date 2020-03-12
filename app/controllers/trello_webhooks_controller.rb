class TrelloWebhooksController < ActionController::Base
  include TrelloWebhook::Processor

  skip_before_action :verify_authenticity_token

  def update_card(payload)
    # binding.pry
    puts "Payload is triggered by '#update_card' =>"
    p payload
    #TODO: Depending on the card List, update task current_status
    # ["Done", "To deploy", "Waiting for client", "To review/debug", "In Progress", "To Do", "Sprint"]
    # Si la card est bougée "action_"
  end

  def create_card(payload)
    # binding.pry
    puts "Payload is triggered by '#create_card' =>"
    p payload
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
