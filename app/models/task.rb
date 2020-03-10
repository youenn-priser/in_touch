class Task < ApplicationRecord
  belongs_to :user_story

  validates :title, presence: true
end
