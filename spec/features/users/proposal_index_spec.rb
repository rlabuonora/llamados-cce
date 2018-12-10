include Warden::Test::Helpers


feature 'Show proposals for a call', :devise do
    
  scenario 'list' do
    call1 = Call.new(nombre: "Vidrieras", centro: "Tacuarembó", publico: "Empresas", modalidad: "Capacitación")
    prop1 = Proposal.create(call: call1, proveedor: "Kolping")
    prop2 = Proposal.create(call: call1, proveedor: "Gepián")
    
    call2 = Call.new(nombre: "Gestión", centro: "Rivera", publico: "Empresas", modalidad: "Capacitación")
    prop3 = Proposal.create(call: call2, proveedor: "Thinkify")
    prop4 = Proposal.create(call: call2, proveedor: "CPE")
    
    user = FactoryBot.create(:user)
    login_as(user, :scope => :user)
    
    #visit call_proposals_url(call1)
    
    visit call_url(call1)
    
    click_link "Ver Propuestas"
    expect(page).to have_text("Kolping")
    expect(page).to have_text("Gepián")
    
    expect(page).not_to have_text("CPE")
    
  end
end