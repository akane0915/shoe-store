require "bundler/setup"
Bundler.require :default
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get "/" do
  erb :index
end

get "/stores" do
  @stores = Store.all
  erb :stores
end

post "/stores" do
  storename = params["storename"]
  new_store = Store.create({storename: storename})
  redirect "/stores"
end
