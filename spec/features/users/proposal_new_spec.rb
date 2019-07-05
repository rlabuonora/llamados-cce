# coding: utf-8
require 'rails_helper'
include Warden::Test::Helpers


feature 'New proposal for a call', :devise do
    
  scenario 'list' do
    call = Call.create(nombre: "Vidrieras", centro: "Tacuarembó", publico: "Empresas", modalidad: "Capacitación")
    
    
    user = FactoryBot.create(:user)
    login_as(user, :scope => :user)
    
    visit call_url(call)
    
    click_link "Agregar Propuesta"
    
    fill_in "Proveedor", with: "Kolping"
    
    click_button "Salvar Propuesta"
    
    expect(current_path).to eq(call_proposals_path(call))
    
  end
end
