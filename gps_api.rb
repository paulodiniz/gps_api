require 'sinatra'
require './bus'

class GpsApi < Sinatra::Base

  get '/' do
    Bus.all.to_json
  end

  post '/line/:line_id/bus/:bus_code/location' do
    b = Bus.where(line: params[:line_id], code: params[:bus_code]).first_or_create
    b.to_json
  end

end