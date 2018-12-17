class Proposal < ApplicationRecord
  belongs_to :call
  has_many :evaluations, dependent: :destroy
end
