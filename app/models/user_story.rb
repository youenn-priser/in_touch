class UserStory < ApplicationRecord
  belongs_to :sprint

  has_many :tasks, optional: true

  validates :trello_card_id, uniqueness: true, allow_nil: true
  validates :title, presence: true

end
