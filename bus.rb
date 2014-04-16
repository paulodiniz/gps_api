require 'mongoid'
require 'mongoid_spacial'

class Bus
  include Mongoid::Document
  include Mongoid::Spacial::Document

  field :name, type: String
  field :line, type: String
  field :code, type: String

  field :position,            type: Array,    spacial: true

  # spacial_index :position
end