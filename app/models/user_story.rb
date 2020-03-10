class UserStory < ApplicationRecord
  belongs_to :sprint


  validates :trello_card_id, uniqueness: true, allow_nil: true
  validates :weight, inclusion: { in: [1, 3, 5] }
  validates :title, presence: true

end
