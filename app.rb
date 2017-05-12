require "bundler/setup"
Bundler.require :default
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get "/" do
  erb :index
end

# Stores Routing
get "/stores" do
  @stores = Store.all
  erb :stores
end

post "/stores" do
  storename = params["storename"]
  @new_store = Store.create({storename: storename})
  if @new_store.save
    redirect "/stores"
  else
    erb :errors
  end
end

get "/stores/:id" do
  store_id = params['id'].to_i
  @store = Store.find(store_id)
  @list_brands = Brand.all
  @store_brands = @store.brands
  erb :store
end

post "/stores/:id" do
  store_id = params['id'].to_i
  brand_id = params['brand'].to_i
  store = Store.find(store_id)
  brand = Brand.find(brand_id)
  store.brands.push(brand)
  redirect "/stores/#{store_id}"
end

patch "/stores/:id" do
  store_id = params['id'].to_i
  store = Store.find(store_id)

  if params['storename']
    updated_storename = params['storename']
    store.update({storename: updated_storename})
  else
  end

  if params['brand_to_remove_id']
    brand_to_remove_id = params['brand_to_remove_id'].to_i
    brand_to_remove = Brand.find(brand_to_remove_id)
    store.brands.destroy(brand_to_remove)
  else
  end
  redirect "/stores/#{store_id}"
end

delete "/stores/:id" do
  store_id = params['id'].to_i
  Store.find(store_id).destroy
  redirect "/stores"
end



# Brands Routing
get "/brands" do
  @brands = Brand.all
  erb :brands
end

post "/brands" do
  brandname = params["brandname"]
  price = params["price"]
  @new_brand = Brand.create({brandname: brandname, price: price})
  if @new_brand.save
    redirect "/brands"
  else
    erb :errors
  end
end

get "/brands/:id" do
  brand_id = params["id"].to_i
  @brand = Brand.find(brand_id)
  erb :brand
end

patch "/brands/:id" do
  brand_id = params["id"].to_i
  brand = Brand.find(brand_id)

  unless params['brandname'] == ""
    updated_brandname = params['brandname']
    brand.update({brandname: updated_brandname})

  end

  unless params['price'] == ""
    updated_price = params['price']
    brand.update({price: updated_price})
  end
  redirect "/brands/#{brand_id}"

end
