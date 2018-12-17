include Warden::Test::Helpers

feature 'Show call', :devise do
    
    
 scenario 'User views Call' do
    user = FactoryBot.create(:user)
    login_as(user, :scope => :user)
    
    
    prop = FactoryBot.create(:proposal)
    response_1 = FactoryBot.build(:empresas_capacitaciones_response)
    
    user_1 = User.create(name: "Usuario 1", email: "changme@change.com", password: "changeme", institucion: "SNTPC")
    user_2 = User.create(name: "Usuario 2", email: "changme@change.com", password: "changeme", institucion: "INEFOP")
    # Esta evaluation es para otro!
    evaluation_1 = Evaluation.create(proposal: prop, user: user_1, evaluatable: response_1)
    evaluation_2 = Evaluation.create(proposal: prop, user: user_2, evaluatable: response_1)
    
    call = prop.call
    visit call_path(call)
    expect(page).to have_text call.nombre
    expect(page).to have_text prop.proveedor
 end
    
end