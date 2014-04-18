require 'mongoid'

class Bus
  include Mongoid::Document

  field :name, type: String
  field :line, type: String
  field :code, type: String

  field :position,            type: Array

  index({ position: "2d" }, { min: -200, max: 200 })
end