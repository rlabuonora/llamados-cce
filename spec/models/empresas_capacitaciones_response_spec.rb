require 'rails_helper'

RSpec.describe EmpresasCapacitacionesResponse, type: :model do
    
    it "belongs to an evaluation" do
     eval = FactoryBot.build(:evaluation)
     response =  EmpresasCapacitacionesResponse.new( 
         formacion_titulo:     5,
         estudios:  5,
         formacion_equipo:  5,
         antecedentes_formacion: 7,
         antecedentes_territorio: 8,
         experiencia_tecno: 6,
         desarrollo: 2,
         pertinencia: 3,
         objetivo: 4,
         metodologia: 6,
         perfil: 9,
         innovacion: 2,
         materiales: 8,
         actividades: 1,
         evaluation: eval
     )
     expect(response.evaluation.user.name).to eq("Test User")
     
     expect(eval.valid?).to eq(true)
     expect(response.save).to eq(true)
     
  end
  
end
