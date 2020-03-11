class TrelloWebhooksController < ActionController::Base
  include TrelloWebhook::Processor

  skip_before_action :verify_authenticity_token

  def update_card(payload)
    # binding.pry
    puts "Payload is:"
    p payload
  end

  def create_card(payload)
    # binding.pry
    p payload

    #TODO: Depending on the card List, update task current_status
    # ["Done", "To deploy", "Waiting for client", "To review/debug", "In Progress", "To Do", "Sprint"]
  end

  def delete_card(payload)
    p payload['model']['id']
    p payload['action']['display']['translationKey']
    p payload
  end

  def webhook_secret
    ENV['TRELLO_TOKEN']  # From https://trello.com/app-key
  end
end
