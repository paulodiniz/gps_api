require './gps_api'
require 'mongoid'

Mongoid.load!("mongoid.yml")
run GpsApi