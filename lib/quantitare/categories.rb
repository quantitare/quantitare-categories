# frozen_string_literal: true

require 'dry/schema'
require 'active_support/inflector'

require 'quantitare/categories/version'
require 'quantitare/category'
require 'quantitare/category/name_parser'

Dir[File.expand_path('categories/*.rb', __dir__)].each { |file| require file }

module Quantitare
  ##
  # = Quantitare Categories
  #
  module Categories
  end
end
