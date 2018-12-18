include Warden::Test::Helpers

feature 'Evaluate propuesta', :devise do
    
    
 scenario 'Usuario evalúa propuestas para un llamado de capacitación para emprendedores' do
    user = FactoryBot.create(:user)
    login_as(user, :scope => :user)
    
    c = Call.create(nombre: "Vidrieras", centro: "Rivera", publico: "Emprendedores", modalidad: "Capacitación")


    Proposal.create(proveedor: "Kolping", call: c)
    Proposal.create(proveedor: "Thinkify", call: c)
    
    visit(call_path(c))
    click_link "Ver Propuestas"
    click_link "Evaluar", match: :first
    
    fill_in "Adecuación de la propuesta metodológica", with: 10
    fill_in "Antecedentes y experiencia de la institución en actividades formativas para emprendedores y Mipymes", with: 10
    fill_in "Conocimiento de la población objetivo", with: 10
    
    click_button "Guardar Evaluacion"
    
    expect(current_path).to eq(call_path(c))
    
 end
 
 
  scenario 'Usuario evalúa propuestas para un llamado de capacitación para empresas' do
    user = FactoryBot.create(:user)
    login_as(user, :scope => :user)
    
    c = Call.create(nombre: "Vidrieras", centro: "Rivera", publico: "Empresas ", modalidad: "Capacitación")


    Proposal.create(proveedor: "Kolping", call: c)
    Proposal.create(proveedor: "Thinkify", call: c)
    
    visit(call_path(c))
    click_link "Ver Propuestas"
    click_link "Evaluar", match: :first
    
    fill_in "Formacion (Titulo de Grado)", with: 10
    fill_in "Experiencia de la entidad de capacitación de cara a proveer servicios educativos basados en nuevas tecnologías", with: 10
    fill_in "Estudios complementarios ", with: 10
    
    click_button "Guardar Evaluacion"
    
    expect(current_path).to eq(call_path(c))
    
 end
    
    
end