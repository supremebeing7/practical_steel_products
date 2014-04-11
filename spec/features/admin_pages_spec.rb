require 'spec_helper'

describe Admin do
  context 'sign in' do
    it 'lets an admin sign in' do
      create_admin_and_sign_in
      page.should have_content 'Add Product'
    end

    it 'throws an error for wrong credentials' do
      admin = FactoryGirl.create :admin
      visit new_session_path
      fill_in 'Username', with: admin.username
      fill_in 'Password', with: 'gbjkfldbgkerbge'
      click_button 'Sign in'
      page.should have_content 'Wrong email or password, jerk'
    end
  end
end
