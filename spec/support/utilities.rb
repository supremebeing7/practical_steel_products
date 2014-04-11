def create_admin_and_sign_in
  admin = FactoryGirl.create :admin
  visit new_session_path
  fill_in 'Username', with: admin.username
  fill_in 'Password', with: admin.password
  click_button 'Sign in'
end
