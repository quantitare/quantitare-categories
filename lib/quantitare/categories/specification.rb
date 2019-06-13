# frozen_string_literal: true

module Quantitare
  module Categories
    ##
    # A specification for a category.
    #
    class Specification
      class << self
        def from_scrobble(scrobble)
          new(scrobble.name)
        end
      end

      attr_reader :name

      def initialize(name)
        @name = name
      end

      def json_schema
        Quantitare::Categories.schemas[name]
      end
    end
  end
end
