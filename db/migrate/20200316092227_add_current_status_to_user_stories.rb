class AddCurrentStatusToUserStories < ActiveRecord::Migration[5.2]
  def change
    add_column :user_stories, :current_status, :string, default: "to do"
  end
end
