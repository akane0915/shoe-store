require "spec_helper"

describe("the store creation path", {:type => :feature}) do
  it("starts on the stores page and creates a new store") do
    visit("/stores")
    expect(page).to have_content("Add a Store")
    fill_in('storename', :with => 'portland')
    click_button('Add Store')
    expect(page).to have_content('Portland')
  end
end

describe("the store update path", {:type => :feature}) do
  it("starts on the stores page and updates a store") do
    store = Store.create({storename: 'portland'})
    visit("/stores")
    click_link('Portland')
    expect(page).to have_content('Update the Portland Store')
    fill_in('storename', :with => 'Portlandia')
    click_button('Update Store Name')
    expect(page).to have_content('Portlandia')
  end
end

describe("the add brand association to store path", {:type => :feature}) do
  it("starts on the store page and adds a brand to that store and then deletes the brand from the store") do
    store = Store.create({storename: 'portland'})
    Brand.create({brandname: 'adidas'})
    visit("/stores/#{store.id}")
    select('Adidas', :from => 'brand')
    click_button('Add Brand to Portland Store')
    expect(page).to have_content('Adidas')
  end

  it("starts on the store page and deletes a brand from the store") do
    store = Store.create({storename: 'tualatin'})
    brand = Brand.create({brandname: 'converse'})
    store.brands.push(brand)
    visit("/stores/#{store.id}")
    expect(page).to have_content('Converse')
    select('Converse', :from => 'brand_to_remove_id')
    click_button('Remove This Brand')
    visit("/stores/#{store.id}")
    expect(page).to have_content('There are currently no brands saved to this store.')
  end
end

describe("the store deletion path", {:type => :feature}) do
  it("starts on the store page and deletes the store") do
    store = Store.create({storename: 'beaverton'})
    visit("/stores/#{store.id}")
    click_button('Delete This Store')
    expect(page).to have_no_content('Beaverton')
  end
end
