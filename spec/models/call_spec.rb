require 'rails_helper'

RSpec.describe Call, type: :model do
  
  
  it "is valid with all fields" do
      
    call = Call.new(nombre: "Vidrieras", centro: "Rivera")
    expect(call.valid?).to eq(true)
     
 end
  
  
  it "is invalid with no nombre" do
     call = Call.new(nombre: "", centro: "Rivera")
     call.valid?
     expect(call.errors[:nombre].any?).to eq(true)
  end
  
  it "is invalid with no centro" do
     call = Call.new(nombre: "Vidrieras", centro: "")
     call.valid?
     expect(call.errors[:centro].any?).to eq(true)
  end
  
  it "is invalid with wrong centro" do
    call = Call.new(nombre: "Vidrieras", centro: "Montevideo")
    call.valid?
    expect(call.errors[:centro].any?).to eq(true) 
  end
  
  it "has many proposals" do
    call = Call.new(nombre: "Vidrieras", centro: "Rivera")
    prop1 = Proposal.create(call: call, proveedor: "Kolping")
    prop2 = Proposal.create(call: call, proveedor: "Gepián")
    call.proposals << prop1
    call.proposals << prop2
    expect(call.proposals.length).to eq(2) 
  end
  
  
  it "deletes associated proposals" do
    call = Call.create(nombre: "Vidrieras", centro: "Rivera")
    prop1 = Proposal.create(call: call, proveedor: "Kolping")
    
    expect {
      call.destroy
    }.to change(Proposal, :count).by(-1)
  end
end
