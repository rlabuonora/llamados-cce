require 'rails_helper'

RSpec.describe EmprendedoresCapacitacionesResponse, type: :model do
  it "belongs to an evaluation" do
     eval = FactoryBot.build(:evaluation)
     response =  EmprendedoresCapacitacionesResponse.new( 
         formacion: 2,
         propuesta:     5,
         antecedentes:  5,
         conocimiento:  5,
         costo:        800,
         horas:         20,
         evaluation: eval
         )
     expect(response.evaluation.user.name).to eq("Test User")
     expect(response.save).to eq(true)
  end
end
