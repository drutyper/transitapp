require 'httparty'
require './db/setup'
require 'pry'
require './lib/all'
require 'sinatra/base'
require './transit_api'
require 'rack/cors'

class TransportApp < Sinatra::Base

use Rack::Cors do
  allow do
    origins '*'
    resource '*', headers: :any, methods: :get
  end
end

before do
    headers["Content-Type"] = "application/json"
end

  enable :logging
  enable :method_override
  enable :sessions

get "/metrostations" do 
  t = TransitAPI.new
  n = t.get_stations
  f = []
  n.each do |s|
    f.push s
    #n["Stations"].map { |s| s.values_at("Code", "Name", "Lat", "Lon","Address")}
  # code = s[0]
  # name = s[1]
  # lat = s[2]
  # lon = s[3]
  # address = s[4]
  # push v into f
  #v = {name: name, code: code, Lat: lat, Lon: lon, Address: address}
end
        binding.pry
    return f.to_json
binding.pry
  end
end

  TransportApp.run!