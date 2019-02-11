include Warden::Test::Helpers

feature 'Editar calls', :devise do

 
  it "Actualiza el llamado si estoy logueado" do
    
    call = Call.create(centro: "Rivera", nombre: "Vidriera", publico: "Empresas", modalidad: "Capacitación")
    user = FactoryBot.create(:user)
    login_as(user, :scope => :user)
    visit call_url(call)
    
    click_link 'Editar Llamado'
    
    expect(current_path).to eq(edit_call_path(call))
        
    expect(find_field('Nombre').value).to eq(call.nombre)
    
    fill_in "Nombre", with: "Validación de Ideas"
    
    select "Asistencia Técnica", :from => "Modalidad"
    
    click_button "Actualizar Llamado"
    
    expect(current_path).to eq(call_path(call))
    expect(page).to have_xpath("//input[@value='Validación de Ideas']")
    expect(page).to have_xpath("//option[@value='Empresas']")
    expect(page).to have_xpath("//option[@value='Asistencia Técnica'][@selected = 'selected']")
    expect(page).to have_text('Llamado Actualizado')
  end
  
    
end