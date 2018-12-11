require 'rails_helper'

RSpec.describe EmprendedoresCapacitacionesResponse, type: :model do
  it "belongs to an evaluation" do
     eval = FactoryBot.build(:evaluation)
     response =  EmprendedoresCapacitacionesResponse.new( 
         propuesta:     5,
         antecedentes:  5,
         conocimiento:  5,
         evaluation: eval
         )
     expect(response.evaluation.user.name).to eq("Test User")
  end
end
