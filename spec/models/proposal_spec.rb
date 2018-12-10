require 'rails_helper'

RSpec.describe Proposal, type: :model do
    
  it "belongs to a call" do
    call = Call.new(nombre: "Vidrieras", centro: "Montevideo")
    prop = Proposal.create(call: call, proveedor: "Kolping")
    expect(prop.call).to eq(call)
  end
  
  it "call factory" do
    proposal = FactoryBot.create(:proposal)
    expect(proposal.proveedor).to eq("Kolping")
    expect(proposal.call.nombre).to eq("Vidrieras")
    expect(proposal.call.publico).to eq("Empresas")
    expect(proposal.call.modalidad).to eq("Capacitación")
  end
end
