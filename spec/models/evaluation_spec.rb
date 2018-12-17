require 'rails_helper'

RSpec.describe Evaluation, type: :model do
    
  before(:each) { 
    
    @user = FactoryBot.build(:user)
    @call = FactoryBot.build(:call)
    @prop = FactoryBot.build(:proposal)
      
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
  
  it "belongs to a user" do
    skip
    eval = FactoryBot.create(:evaluation)
    expect(eval.user.name).to eq("Test User")
  end
  
  it "it is asociated with a evaluation" do
    skip
    response = FactoryBot.create(:asistencia_empresas_response)
    expect(response.evaluation.user.name).to eq("Test User")
  end
  
  it "binds to the associated call" do
    call_attr = attributes_for(:call)
    call = Call.new(call_attr)
    
    prop = Proposal.new(call: call, proveedor: "Kolping")
    
    user = FactoryBot.create(:user)
    
    responses = FactoryBot.build(:empresas_capacitaciones_response)
    
    evaluation1 = Evaluation.new(user: user, proposal: prop, evaluatable: responses)
    
    expect {
      evaluation1.save
    }.to change(Evaluation, :count).by(1)
    
  end
  
  it "binds to the associated call" do
    call_attr = attributes_for(:call)
    call = Call.new(call_attr)
    
    prop = Proposal.new(call: call, proveedor: "Kolping")
    
    user = FactoryBot.create(:user)
    
    responses = FactoryBot.build(:empresas_capacitaciones_response)
    
    evaluation1 = Evaluation.new(user: user, proposal: prop, evaluatable: responses)
    
    
    expect(call.evaluations.size).to eq(0)
    evaluation1.save
    expect(call.evaluations.size).to eq(1)
    
    expect(call.evaluations.first.evaluatable.exp_pob).to eq(6)
    expect(call.proposals.first.proveedor).to eq("Kolping")
    
#    expect {
#      evaluation1.save
#    }.to change(Evaluation, :count).by(1)
    
  end
  
  it "has a response" do
    #eval = FactoryBot.build_stubbed(:evaluation)
    #puts eval.user.email
    #response = FactoryBot.build(:asistencia_empresas_response)
  end
  
  it "belongs to evaluatable" do
    eval = Evaluation.new(user: @user, proposal: @prop)
    response = FactoryBot.build(:emprendedores_capacitaciones_response)
    expect(response.propuesta).to eq(5)
    response.evaluation = eval
    expect(response.evaluation.user).to eq(@user)
  end
  
  it "has a response" do
    eval = Evaluation.new(user: @user, proposal: @prop)
    response = FactoryBot.build(:emprendedores_capacitaciones_response)
    eval.evaluatable = response 
    expect(eval.evaluatable.propuesta).to eq(5)
    eval.evaluatable.propuesta = 6
    expect(eval.evaluatable.propuesta).to eq(6)
  end
  
  it "overrides method missing" do
    eval = Evaluation.new(user: @user, proposal: @prop)
    response = FactoryBot.build(:emprendedores_capacitaciones_response)
    eval.evaluatable = response 
    expect(eval.antecedentes).to eq(5)
    eval.antecedentes = 6
    expect(eval.antecedentes).to eq(6)
  end
end
