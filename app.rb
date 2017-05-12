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
  new_store = Store.create({storename: storename})
  redirect "/stores"
end

get "/stores/:id" do
  store_id = params['id'].to_i
  @store = Store.find(store_id)
  erb :store
end


# Brands Routing
get "/brands" do
  @brands = Brand.all
  erb :brands
end

post "/brands" do
  brandname = params["brandname"]
  price = params["price"]
  new_brand = Brand.create({brandname: brandname, price: price})
  redirect "/brands"
end
