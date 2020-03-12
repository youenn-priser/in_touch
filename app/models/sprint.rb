class Sprint < ApplicationRecord
  belongs_to :project
  has_many :user_stories

  validates :title, presence: true
  validates :trello_list_id, uniqueness: true, allow_nil: true

end
