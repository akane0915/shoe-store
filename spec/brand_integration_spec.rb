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

describe("the brand update path", {:type => :feature}) do
  it("starts on the brands page and updates a brand") do
    brand = Brand.create({brandname: 'lulu'})
    visit("/brands")
    click_link('Lulu')
    expect(page).to have_content('Update the Lulu Brand')
    fill_in('brandname', :with => 'Lululemon')
    fill_in('price', :with => 100)
    click_button('Update Brand')
    expect(page).to have_content('Lululemon')
  end
end

describe("the brand deletion path", {:type => :feature}) do
  it("starts on the brand page and deletes the brand") do
    brand = Brand.create({brandname: 'lulu'})
    visit("/brands/#{brand.id}")
    click_button('Delete This Brand')
    expect(page).to have_no_content('Lulu')
  end
end
