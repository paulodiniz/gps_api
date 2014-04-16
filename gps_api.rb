require 'sinatra'
require 'mongo'
require 'json/ext'

class GpsApi < Sinatra::Base

  include Mongo

  configure do
    conn = MongoClient.new("localhost", 27017)
    set :mongo_connection, conn
    set :mongo_db, conn.db('data')
  end

  helpers do
    def db
      settings.mongo_db['data']
    end
  end

  get '/' do
    db.find.to_a.to_json
  end

  post '/line/:line_id/bus/:bus_id/location' do
    reg = db.find(line: params[:line_id].to_i, bus: params[:bus_id].to_i).first
    reg.update('lat' => params[:lat].to_f)
    reg.update('lon' => params[:lon].to_f)
    require 'pry';binding.pry
    # reg
    'ok'
  end

end