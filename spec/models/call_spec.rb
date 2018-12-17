require 'rails_helper'

RSpec.describe Call, type: :model do
  
  
  it "is valid with all fields" do
    call = Call.new(nombre: "Vidrieras", centro: "Rivera", publico: "Empresas", modalidad: "Capacitación")
    expect(call.valid?).to eq(true)
 end
  
  it "is invalid with no publico" do
     skip "not implemented"
     call = FactoryBot.build(:call, publico: "")
     call.valid?
     expect(call.errors[:publico].any?).to eq(true)
     call.valid?
     call.publico = "Gente"
     expect(call.errors[:publico].any?).to eq(true)
  end
  
  it "is invalid with no nombre" do
     call = FactoryBot.build(:call, nombre: "")
     call.valid?
     expect(call.errors[:nombre].any?).to eq(true)
  end
  
  it "is invalid with no centro" do
     call = FactoryBot.build(:call, centro: "")
     call.valid?
     expect(call.errors[:centro].any?).to eq(true)
  end
  
  it "is invalid with wrong centro" do
    call = FactoryBot.build(:call, centro: "Montevideo")
    call.valid?
    expect(call.errors[:centro].any?).to eq(true) 
  end
  
  it "has many proposals" do
    call = FactoryBot.create(:call)
    prop1 = FactoryBot.create(:proposal, call: call, proveedor: "Kolping")
    prop2 = FactoryBot.create(:proposal, call: call, proveedor: "Gepián")
    call.proposals << prop1
    call.proposals << prop2
    expect(call.proposals.length).to eq(2) 
  end
  
  
  it "deletes associated proposals" do
    call = FactoryBot.create(:call)
    prop1 = FactoryBot.create(:proposal, call: call, proveedor: "Kolping")
    
    expect {
      call.destroy
    }.to change(Proposal, :count).by(-1)
  end
  

  
  it "has many evaluations through propuestas" do
    prop = FactoryBot.create(:proposal)
    response_1 = FactoryBot.build(:empresas_capacitaciones_response)
   
    
    user_1 = User.create(name: "Usuario 1", email: "changme@change.com", password: "changeme", institucion: "SNTPC")
    user_2 = User.create(name: "Usuario 2", email: "changme@change.com", password: "changeme", institucion: "INEFOP")
    # Esta evaluation es para otro!
    evaluation_1 = Evaluation.create(proposal: prop, user: user_1, evaluatable: response_1)
    evaluation_2 = Evaluation.create(proposal: prop, user: user_2, evaluatable: response_1)
    

    # Tienen la misma propuesta
    expect(evaluation_1.proposal).to eq(evaluation_2.proposal)
    
    # Tienen el mismo call
    expect(evaluation_1.proposal.call).to eq(evaluation_2.proposal.call)
    
    # Tienen distinto usuario
    expect(evaluation_1.user).to eq(user_1)
    expect(evaluation_2.user).to eq(user_2)

    c = evaluation_1.proposal.call
    
    expect(c.publico).to eq("Empresas")
    expect(c.proposals.size).to eq(1)
    expect(c.evaluations.size).to eq(2)
    
  end

end
