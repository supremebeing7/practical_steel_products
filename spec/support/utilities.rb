def create_admin_and_sign_in
  admin = FactoryGirl.create :admin
  visit new_session_path
  fill_in 'Username', with: admin.username
  fill_in 'Password', with: admin.password
  click_button 'Sign in'
end

def create_owner_and_sign_in
  owner = FactoryGirl.create :owner
  visit new_session_path
  fill_in 'Username', with: owner.username
  fill_in 'Password', with: owner.password
  click_button 'Sign in'
end

def create_product
  product = FactoryGirl.build :product
  visit new_product_path
  fill_in 'Name', with: product.name
  fill_in 'Price', with: product.price
  fill_in 'Description', with: product.description
  attach_file("Image", File.expand_path("./app/assets/images/apple_logo_rainbow_fruit.jpg"))
end
