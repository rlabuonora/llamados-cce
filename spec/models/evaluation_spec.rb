require 'rails_helper'

RSpec.describe Evaluation, type: :model do
    
  before(:each) { @user = User.new(email: 'user@example.com',
                                   name: 'Example User',
                                   institucion: 'STPC') 
      
    @call = Call.new(nombre: "Vidrieras", centro: "Montevideo")
    @prop = Proposal.create(call: @call, proveedor: "Kolping")
      
  }
    
  it "has a user" do
    eval = Evaluation.new(user: @user, proposal: @prop)
    expect(eval.user).to eq(@user)
  end
  
  it "belongs to a propuesta" do
    eval = Evaluation.new(user: @user, proposal: @prop)
    expect(eval.proposal).to eq(@prop)
  end
  
  
  it "is not valid sin propuesta" do
    eval = Evaluation.new(user: @user)
    eval.valid?
    expect(eval.errors[:proposal].any?).to eq(true)
  end
  
  it "is not valid sin user" do
    eval = Evaluation.new(proposal: @prop)
    eval.valid?
    expect(eval.errors[:user].any?).to eq(true)
  end
end
