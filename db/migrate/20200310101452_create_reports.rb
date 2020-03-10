class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.references :project, foreign_key: true
      t.string :description
      t.string :status

      t.timestamps
    end
  end
end
