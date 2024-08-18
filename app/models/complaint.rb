class Complaint < ApplicationRecord
  validates :username, :complaint, presence: true
end
