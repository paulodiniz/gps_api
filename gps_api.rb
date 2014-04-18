require 'sinatra'
require './bus'

class GpsApi < Sinatra::Base

  get '/' do
    Bus.all.to_json
  end

  post '/line/:line_id/bus/:bus_code/location' do
    b = Bus.where(line: params[:line_id], code: params[:bus_code]).first_or_create
    if params[:lat] && params[:lng]
      b.position = {:lat => params[:lat].to_f, :lng => params[:lng].to_f}
      b.save
    end
    b.to_json
  end

  get '/near/:lat/:lng' do
    if params[:lat] && params[:lng]
      Bus.where(:position.near => [params[:lat].to_f, params[:lng].to_f,5]).to_json
    end
  end

end