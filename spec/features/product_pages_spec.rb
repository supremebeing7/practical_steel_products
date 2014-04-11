require 'spec_helper'

describe Product do
  context 'creating' do
    it 'lets an admin create a product' do
      create_admin_and_sign_in
      create_product
      click_button 'Create Product'
      save_and_open_page
      page.should have_content "Product Added."
    end
    it 'throws an error for missing field' do
      product = FactoryGirl.create :product
      visit new_product_path
      click_button 'Create Product'
      page.should have_content "Please fix these errors"
    end
  end
end
