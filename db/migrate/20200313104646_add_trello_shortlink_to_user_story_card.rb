class AddTrelloShortlinkToUserStoryCard < ActiveRecord::Migration[5.2]
  def change
    add_column :user_stories, :trello_card_short_link, :string
  end
end
