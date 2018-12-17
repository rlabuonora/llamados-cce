class Evaluation < ApplicationRecord
  belongs_to :proposal
  belongs_to :user
  belongs_to :evaluatable, polymorphic: true, dependent: :destroy
  validates :proposal, presence: true
  validates :user, presence: true


  def method_missing(method_name, *args, &block)
    # TODO: check for attributes in evaluatable
    evaluatable.send(method_name, *args, &block)
  end
  
  def respond_to_missing?(method_name, *args)
    #method_name == :bark or super
  end
  
end
