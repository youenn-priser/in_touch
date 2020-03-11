class ChangeDefaultValue < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:projects, :done, from: nil, to: false)
    change_column_default(:sprints, :done, from: nil, to: false)
    change_column_default(:user_stories, :done, from: nil, to: false)
  end
end
