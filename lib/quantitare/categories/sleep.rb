# frozen_string_literal: true

module Quantitare
  module Categories
    ##
    # A representation of a segment of a user's non-waking sleep activity. Includes a "depth" measurement, which is a
    # rough estimate of the depth of sleep during the segment.
    #
    class Sleep < Quantitare::Category
      DEPTHS = [
        D_LIGHT = 'light',
        D_DEEP = 'deep',
        D_REM = 'rem'
      ].freeze

      specification do
        optional(:depth).value(included_in?: DEPTHS)
      end
    end
  end
end
