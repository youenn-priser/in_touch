class Report < ApplicationRecord

  belongs_to :project

  validates :description, presence: true

end
