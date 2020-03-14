class CreateTrelloWebhookJob < ApplicationJob
  queue_as :webhook

  def perform(project_id)
    # Find the project trello_board_id
    project = Project.find(project_id)
    board_id = project.trello_board_id
    user = project.user
    # Do something later
    callback_url = "http://#{ENV['DOMAIN']}/trello_webhooks"

    params = {
      idModel: board_id,
      callbackURL: callback_url,
      description: "InTouch board webhook",
      active: true,
      key: ENV['TRELLO_API_KEY'],
      token: user.token
    }

    RestClient.post "https://api.trello.com/1/webhooks/", params
  end
end
