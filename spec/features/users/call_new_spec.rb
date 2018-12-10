include Warden::Test::Helpers

feature 'Show calls', :devise do
    
    
 scenario 'user lists calls' do
    user = FactoryBot.create(:user)
    login_as(user, :scope => :user)
    visit new_call_path
    expect(current_path).to eq(new_call_path)
    
    fill_in "Nombre", with: "Validación de Ideas"

    select "Rivera", :from => "Centro"
    select "Empresas", :from => "Publico"
    select "Capacitación", :from => "Modalidad"
    
    click_button "Crear Llamado"
    expect(current_path).to eq(call_path(Call.last))
    expect(page).to have_text "Validación de Ideas"
 end
    
end