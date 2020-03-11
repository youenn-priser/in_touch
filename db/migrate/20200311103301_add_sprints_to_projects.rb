class AddSprintsToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :sprints, :integer
  end
end
