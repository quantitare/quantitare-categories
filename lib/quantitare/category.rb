# frozen_string_literal: true

module Quantitare
  ##
  # Root class for a Quantitare category. Provides the validation logic and metadata for a scrobble's +data+ attribute.
  # The specification DSL uses the +dry-schema+ gem under the hood.
  #
  #   class Quantitare::Categories::Music < Quantitare::Category
  #     specification do
  #
  #     end
  #   end
  #
  class Category
    SPECIFICATIONS_IVAR_NAME = '@specifications'
    ROOT_CATEGORY = self

    class << self
      attr_accessor :specification_blk
      attr_reader :name

      def inherited(subklass)
        subklass.name = NameParser.new(subklass).name
      end

      def name=(new_name)
        specifications.delete(name)
        @name = new_name
        specifications[name] = self
      end

      def [](name)
        specifications[name]
      end

      def get(category_name)
        ROOT_CATEGORY[category_name] || default
      end

      def schema
        @schema ||= specification_blk && Dry::Schema.JSON(&specification_blk)
      end

      def specification(&blk)
        self.specification_blk = blk
      end

      def default
        ROOT_CATEGORY
      end

      def icon
        Icon.new
      end

      private

      def specifications
        return specifications_from_root if specifications_from_root

        ROOT_CATEGORY.instance_variable_set(SPECIFICATIONS_IVAR_NAME, {})

        specifications_from_root
      end

      def specifications_from_root
        ROOT_CATEGORY.instance_variable_get(SPECIFICATIONS_IVAR_NAME)
      end
    end

    self.name = 'default'

    attr_reader :data

    def initialize(data)
      @data = data
    end

    def icon
      self.class.icon
    end

    def name
      self.class.name
    end

    def valid?
      return true unless schema

      schema.(data).errors.empty?
    end

    private

    def schema
      self.class.schema
    end
  end
end
