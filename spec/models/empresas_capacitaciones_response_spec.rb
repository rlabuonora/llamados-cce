require 'rails_helper'

RSpec.describe EmpresasCapacitacionesResponse, type: :model do
    
    it "belongs to an evaluation" do
     eval = FactoryBot.build(:evaluation)
     response =  EmpresasCapacitacionesResponse.new( 
         formacion_titulo:     5,
         estudios:  5,
         formacion_equipo:  5,
         evaluation: eval
         )
     expect(response.evaluation.user.name).to eq("Test User")
     
     expect(eval.valid?).to eq(true)
     
     
  end
  
end
