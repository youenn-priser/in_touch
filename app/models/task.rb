class Task < ApplicationRecord
  belongs_to :user_story

  validates :title, presence: true
  validates :trello_card_id, uniqueness: true, allow_nil: true
  # validates :current_status, inclusion: { in: ["Done", "To deploy", "Waiting for client", "To review/debug", "In progress", "To do"] }
end
