require "spec_helper"

describe("the brand creation path", {:type => :feature}) do
  it("starts at the homepage and creates a new brand") do
    visit("/")
    click_link("Brands")
    expect(page).to have_content("Add a Brand")
    fill_in('brandname', :with => 'adidas')
    fill_in('price', :with => 10)
    click_button('Add Brand')
    expect(page).to have_content('Adidas')
  end
end
