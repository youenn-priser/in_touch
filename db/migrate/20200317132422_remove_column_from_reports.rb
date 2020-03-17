class RemoveColumnFromReports < ActiveRecord::Migration[5.2]
  def change
    remove_column :reports, :status
  end
end
