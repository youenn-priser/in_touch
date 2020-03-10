class CreateUserStories < ActiveRecord::Migration[5.2]
  def change
    create_table :user_stories do |t|
      t.references :sprint, foreign_key: true
      t.boolean :done
      t.string :title
      t.string :trello_card_id

      t.timestamps
    end
  end
end
