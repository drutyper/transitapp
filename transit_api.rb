require "httparty"
require "json"
require "pry"
require "haversine"

class TransitAPI

  include HTTParty
  base_uri 'http://api.wmata.com'
  Token = File.read "./authkey.txt"

  def initialize
    #headers = { "Authorization" => "token #{Token}"}
  end
  
  def get_stations

    s = TransitAPI.get("/Rail.svc/json/jStations", query: { api_key: "#{Token}" })  
    stations = s["Stations"].map { |n| n.values_at("Code", "Name", "Lat","Lon","Address")}
    #s = stations[1] #to get the first array in the hash
  end
  
  def get_trains
    m = TransitAPI.get("/StationPrediction.svc/json/GetPrediction/All", query: { api_key: "#{Token}" })

    train = m["Trains"].map { |n| n.values_at("Destination", "Line", "LocationName", "Min") }
  end

 
  def destination
    m = TransitAPI.get("/StationPrediction.svc/json/GetPrediction/All", query: { api_key: "#{Token}" })
    t = m["Trains"]
    #t[0]["Car"] => "6"
    #t[0]["Group"] => "1"
  end
  
end

t = TransitAPI.new


# t.get_stations
# s.keys
# s["Stations"].first
# s["Stations"].first.keys


















