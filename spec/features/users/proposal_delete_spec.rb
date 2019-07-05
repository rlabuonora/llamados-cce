require 'rails_helper'
include Warden::Test::Helpers


# Feature: User delete
#   As a user
#   I want to delete my user profile
#   So I can close my account
feature 'User delete', :devise do

  after(:each) do
    Warden.test_reset!
  end

  # Scenario: User can delete own account
  #   Given I am signed in
  #   When I delete my account
  #   Then I should see an account deleted message
  scenario 'user can delete proposals' do
    user = FactoryBot.create(:user)
    login_as(user, :scope => :user)
    # Este llamado viene con una propuesta
    prop = FactoryBot.create(:proposal)
    visit call_proposals_url(prop.call)
    
    expect(page).to have_text("Kolping")
    first(:link, "Eliminar").click
    #page.driver.browser.switch_to.alert.accept
    expect(page).to have_text 'Propuesta Eliminada'
    
  end

end




