# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product do
    name Faker::Commerce.product_name
    price "3.56"
    description Faker::Lorem.sentence(3)
    # image { fixture_file_upload(Rails.root.join('app', 'assets', 'images', 'apple_logo_rainbow_fruit.jpg'), 'image/jpg') }
  end
end
