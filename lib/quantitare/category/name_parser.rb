# frozen_string_literal: true

module Quantitare
  class Category
    ##
    # @private
    #
    class NameParser
      attr_reader :category_klass

      def initialize(category_klass)
        @category_klass = category_klass
      end

      def name
        ActiveSupport::Inflector.underscore(category_klass.to_s.split('::').last)
      end
    end
  end
end
