class AddTrelloUrlToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :trello_board_url, :string
  end
end
