class AddClientEmailToReports < ActiveRecord::Migration[5.2]
  def change
    add_column :reports, :client_email, :string
  end
end
