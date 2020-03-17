class AddTrelloWebhookIdToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :trello_webhook_id, :string
  end
end
