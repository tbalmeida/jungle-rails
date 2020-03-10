require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    @category.products.create!(
      name:  Faker::Hipster.sentence(3),
      description: Faker::Hipster.paragraph(4),
      image: open_asset('apparel1.jpg'),
      quantity: 10,
      price: 64.99
    )
  end

  scenario "Check details of a product" do
    visit root_path

    page.has_content?('My Cart (0)')

    page.find_button("Add").click
    page.has_content?('My Cart (1)')

    save_screenshot
  
  end
end
