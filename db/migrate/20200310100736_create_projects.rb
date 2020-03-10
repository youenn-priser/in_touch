class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.references :client, foreign_key: true
      t.references :user, foreign_key: true
      t.string :title
      t.boolean :done
      t.string :trello_board_id

      t.timestamps
    end
  end
end
