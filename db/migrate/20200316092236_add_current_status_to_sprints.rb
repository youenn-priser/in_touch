class AddCurrentStatusToSprints < ActiveRecord::Migration[5.2]
  def change
    add_column :sprints, :current_status, :string, default: "to do"
  end
end
