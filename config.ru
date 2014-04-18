require './gps_api'
require 'mongoid'

Mongoid.load!("mongoid.yml")


require './bus'
run GpsApi