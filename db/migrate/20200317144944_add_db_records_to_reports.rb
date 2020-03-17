class AddDbRecordsToReports < ActiveRecord::Migration[5.2]
  def change
    add_column :reports, :actual_db_record, :string
  end
end
