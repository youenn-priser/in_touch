class AddReportTopicToReports < ActiveRecord::Migration[5.2]
  def change
    add_column :reports, :report_topic, :string
  end
end
