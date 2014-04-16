require 'sinatra'
require './bus'

class GpsApi < Sinatra::Base

  get '/' do
    Bus.all.to_json
  end

  post '/line/:line_id/bus/:bus_code/location' do
    b = Bus.create!(line: params[:line_id], code: params[:bus_code])
    b.to_json
  end

end