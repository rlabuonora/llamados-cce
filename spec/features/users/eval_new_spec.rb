include Warden::Test::Helpers

feature 'Evaluate propuesta', :devise do
    
    
 scenario 'user evalua propuestas' do
    user = FactoryBot.create(:user)
    login_as(user, :scope => :user)
    
    c = Call.create(nombre: "Vidrieras", centro: "Rivera", publico: "Empresas", modalidad: "Capacitación")


    Proposal.create(proveedor: "Kolping", call: c)
    Proposal.create(proveedor: "Thinkify", call: c)
    
    visit(call_path(c))
    click_link "Ver Propuestas"
    click_link "Evaluar"
    
    fill_in "Experiencia con Población Objetivo", with: 10
    fill_in "Formacion", with: 10
    fill_in "Experiencia Laboral", with: 10
    
    fill_in "Entrevista", with: 10
    
    click_button "Guardar Evaluacion"
    
    expect(current_path).to eq(call_path(call))
    
 end
    
end