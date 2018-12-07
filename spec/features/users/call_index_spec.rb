include Warden::Test::Helpers

feature 'Show calls', :devise do
    
    
 scenario 'user lists calls' do
    user = FactoryBot.create(:user)
    login_as(user, :scope => :user)
    visit calls_path
    expect(page).to have_content 'Llamados'
 end
    
end