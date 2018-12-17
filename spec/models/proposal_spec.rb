require 'rails_helper'

RSpec.describe Proposal, type: :model do
    
  it "belongs to a call" do
    call = Call.new(nombre: "Vidrieras", centro: "Montevideo")
    prop = Proposal.create(call: call, proveedor: "Kolping")
    expect(prop.call).to eq(call)
  end
  
  it "proposal factory" do
    proposal = FactoryBot.create(:proposal)
    expect(proposal.proveedor).to eq("Kolping")
    expect(proposal.call.nombre).to eq("Vidrieras")
    expect(proposal.call.publico).to eq("Emprendedores")
    expect(proposal.call.modalidad).to eq("Capacitación")
  end
  
  it "has many evaluations" do
    proposal = FactoryBot.create(:proposal)
    evaluation = FactoryBot.build(:evaluation)
    # Llego al usuario
    expect(evaluation.user.name).to eq("Test User")
    # Llego al llamado
    #expect(evaluation.call.publico).to eq("Empresas")
    #proposal.evaluations << FactoryBot.build(:evaluation)
  end
  
  it "can be destroyed" do
    proposal = FactoryBot.create(:proposal)
    response = FactoryBot.build(:empresas_capacitaciones_response)
    evaluation = FactoryBot.create(:evaluation, evaluatable: response)
    
    proposal.evaluations << evaluation
    expect(proposal.evaluations.size).to eq(1)
    
    expect{
     proposal.destroy
    }.to change(Proposal, :count).by(-1)
  end
end
