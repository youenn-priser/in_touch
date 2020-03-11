class Sprint < ApplicationRecord
  belongs_to :project

  validates :title, presence: true
  validates :trello_list_id, uniqueness: true, allow_nil: true

end
