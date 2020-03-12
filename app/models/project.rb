class Project < ApplicationRecord

  belongs_to :client
  belongs_to :user
  has_many :reports
  has_many :sprints
  has_many :user_stories, through: :sprints
  has_many :tasks, through: :user_stories

  validates :title, presence: true, uniqueness: { scope: :client_id }
  validates :trello_board_id, uniqueness: true, allow_nil: true

end
