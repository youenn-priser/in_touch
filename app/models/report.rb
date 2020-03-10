class Report < ApplicationRecord


  belongs_to :project

  validates :description, presence: true
  validates :status, presence: true, inclusion: { in: ['draft', 'sent'] }
end
