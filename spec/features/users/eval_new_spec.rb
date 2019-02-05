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
    
    page.select "5", from: "Formación y experiencia del equipo docente asignado a las actividades"
    page.select "4", from: "Adecuación de la propuesta metodológica"
    page.select "6", from: "Antecedentes y experiencia de la institución en actividades formativas para emprendedores y Mipymes"
    
    page.select "6", from: "Conocimiento de la población objetivo"
    fill_in "Costo Total", with: 100
    fill_in "Horas",       with: 30
    
    
    click_button "Guardar Evaluación"
    
    expect(current_path).to eq(call_path(c))
    expect(page).to have_text(p.proveedor)
    expect(page).to have_text(user.name)
    
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
    page.select "10", from: "Formación (Título de Grado)"
    page.select "5", from: "Estudios complementarios"
    page.select "10", from: "Formación del equipo docente"
    page.select "20", from: "Antecedentes y experiencia en formación de la entidad de capacitación"
    page.select "15", from: "Antecedentes y experiencia en el territorio o en otros territorios"
    page.select "3", from: "Experiencia de la entidad de capacitación de cara a proveer servicios educativos basados en nuevas tecnologías"

    page.select "5", from: "Desarrollo esperado de todos los contenidos"
    page.select "10", from: "Pertinencia y objetivos descritos"
    page.select "0", from: "Construcción de objetivo con los participantes"
    page.select "10", from: "Metodología a implementar"
    page.select "3", from: "Descripción del perfil de ingreso y egreso del participante"
    page.select "5", from: "Innovación en la implementación"
    page.select "10", from: "¿Describe materiales didáctico, infraestructura requerida, equipos y complementos?"
    page.select "10", from: "¿Describe actividades o estrategias para la evaluación de los contenidos transmitidos?"
    

    click_button "Guardar Evaluación"
    
    expect(current_path).to eq(call_path(c))
    expect(page).to have_text(p.proveedor)
    expect(page).to have_text(user.name)
    #expect(page).to have_text("10")
    
 end
    
    
end