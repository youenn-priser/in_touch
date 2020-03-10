class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.references :user_story, foreign_key: true
      t.integer :weight
      t.string :title
      t.string :content
      t.string :current_status
      t.string :trello_card_id

      t.timestamps
    end
  end
end
