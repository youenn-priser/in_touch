class Task < ApplicationRecord
  belongs_to :user_story

  validates :title, presence: true
  validates :trello_card_id, uniqueness: true, allow_nil: true

end
