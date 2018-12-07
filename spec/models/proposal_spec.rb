require 'rails_helper'

RSpec.describe Proposal, type: :model do
    
  it "belongs to a call" do
    call = Call.new(nombre: "Vidrieras", centro: "Montevideo")
    prop = Proposal.create(call: call, proveedor: "Kolping")
    expect(prop.call).to eq(call)
  end
end
