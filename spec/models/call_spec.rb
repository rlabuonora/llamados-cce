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
  
  it "factory" do
    pending "not working"
    call = FactoryBot.create(:call)
    expect(call.nombre).to eq("Vidrieras") 
    expect(call.proposals.size).to eq(1)
  end
end
