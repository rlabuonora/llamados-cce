include Warden::Test::Helpers

feature 'Evaluate propuesta', :devise do
    
    
 scenario 'Usuario evalúa propuestas para un llamado de capacitación para emprendedores' do
    user = FactoryBot.create(:user)
    login_as(user, :scope => :user)
    
    c = Call.create(nombre: "Vidrieras", centro: "Rivera", publico: "Emprendedores", modalidad: "Capacitación")


    p = Proposal.create(proveedor: "Otro Proveedor", call: c)
    visit(call_proposals_path(c))

    expect(page).to have_text(c.nombre)
    expect(page).to have_text(p.proveedor)
    
    click_link "Evaluar"
    
    expect(page).to have_text("Evaluar Propuesta")
    
    fill_in "Adecuación de la propuesta metodológica", with: 10
    fill_in "Antecedentes y experiencia de la institución en actividades formativas para emprendedores y Mipymes", with: 10
    fill_in "Conocimiento de la población objetivo", with: 10
    
    click_button "Guardar Evaluación"
    
    expect(current_path).to eq(call_path(c))
    expect(page).to have_text(p.proveedor)
    expect(page).to have_text(user.name)
    expect(page).to have_text("10")
    
    
 end
 
 
  scenario 'Usuario evalúa propuestas para un llamado de capacitación para empresas' do
    user = FactoryBot.create(:user)
    login_as(user, :scope => :user)
    
    c = Call.create(nombre: "Vidrieras", centro: "Rivera", publico: "Empresas", modalidad: "Capacitación")


    p = Proposal.create(proveedor: "Proveedor", call: c)

    visit(call_proposals_path(c))

    expect(page).to have_text(c.nombre)
    expect(page).to have_text(p.proveedor)
    
    click_link "Evaluar"

    expect(page).to have_text("Evaluar Propuesta")
    fill_in "Formación (Título de Grado)", with: 10
    fill_in "Experiencia de la entidad de capacitación de cara a proveer servicios educativos basados en nuevas tecnologías", with: 10
    fill_in "Estudios complementarios", with: 10
    
    click_button "Guardar Evaluación"
    
    expect(current_path).to eq(call_path(c))
    expect(page).to have_text(p.proveedor)
    expect(page).to have_text(user.name)
    #expect(page).to have_text("10")
    
 end
    
    
end