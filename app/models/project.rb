class Project < ApplicationRecord
  belongs_to :client_id
  belongs_to :user_id
end
