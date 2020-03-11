class ChangeNameSprintInProjects < ActiveRecord::Migration[5.2]
  def change
    rename_column :projects, :sprints, :number_of_sprints
  end
end
