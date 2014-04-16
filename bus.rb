require 'mongoid'

class Bus
  include Mongoid::Document
  field :name, type: String
  field :line, type: String
  field :code, type: String
end