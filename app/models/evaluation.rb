class Evaluation < ApplicationRecord
  belongs_to :proposal
  belongs_to :user
  
  validates :proposal, presence: true
  validates :user, presence: true

end
