class CreateSprints < ActiveRecord::Migration[5.2]
  def change
    create_table :sprints do |t|
      t.references :project, foreign_key: true
      t.string :title
      t.boolean :done
      t.string :trello_list_id

      t.timestamps
    end
  end
end
