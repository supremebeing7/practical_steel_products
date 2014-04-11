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
  context 'add additional admins' do
    it 'allows owner to create another admin' do
      create_admin_and_sign_in
      visit new_admin_path
      fill_in 'Username', with: Faker::Internet.user_name
      password = Faker::Internet.password
      fill_in 'Password', with: password
      fill_in 'Password confirmation', with: password
      click_button 'Create Admin'
      page.should have_content 'Admin created.'
    end
  end
end
