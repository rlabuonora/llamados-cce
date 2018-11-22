module Features
  module SessionHelpers
    def sign_up_with(email, nombre, institucion, password, confirmation)
      visit new_user_registration_path
      fill_in 'Email', with: email
      fill_in 'Nombre', with: nombre
      select 'STPC', from: 'Institucion'
      fill_in 'Password', with: password
      fill_in 'Password confirmation', :with => confirmation
      click_button 'Sign up'
    end

    def signin(email, password)
      visit new_user_session_path
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      click_button 'Sign in'
    end
  end
end
