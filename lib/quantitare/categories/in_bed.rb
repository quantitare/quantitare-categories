# frozen_string_literal: true

module Quantitare
  module Categories
    ##
    # A representation of a segment time a that user spent in bed. These segments are intended to overlap with, rather
    # than be multually exclusive to, a user's {Sleep} segments.
    #
    class InBed < Quantitare::Category
      specification do
      end
    end
  end
end
