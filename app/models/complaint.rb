class Complaint < ApplicationRecord
  belongs_to :category
  validates :username, :complaint, presence: true
end
