class TrelloWebhooksController < ActionController::Base
  include TrelloWebhook::Processor

  skip_before_action :verify_authenticity_token

  def update_card(payload)
    # binding.pry
    puts "Payload Update is:"
    p payload
  end

  def create_card(payload)
    # binding.pry
    puts "Payload CREATE is:"
    p payload

    #TODO: Depending on the card List, update task current_status
    # ["Done", "To deploy", "Waiting for client", "To review/debug", "In Progress", "To Do", "Sprint"]
  end

  def delete_card(payload)
    puts "Payload DELETE is:"
    p payload['model']['id']
    p payload['action']['display']['translationKey']
    p payload['action']['data']['card']['id']
    p payload
  end

  def add_attachment_to_card(payload)
    puts "Payload is:"
    p payload
  end
  def update_list(payload)
    puts "Payload is:"
    p payload
  end

  def webhook_secret
    ENV['TRELLO_TOKEN']  # From https://trello.com/app-key
  end
end
