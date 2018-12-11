class Evaluation < ApplicationRecord
  belongs_to :proposal
  belongs_to :user
  belongs_to :evaluatable, polymorphic: true  
  validates :proposal, presence: true
  validates :user, presence: true

end
