# frozen_string_literal: true

module Quantitare
  module Categories
    ##
    # A representation of a number of floors climbed by the user at a given time or span of time.
    #
    class FloorsClimbed < Quantitare::Category
      specification do
        required(:count).filled { float? | int? }
      end
    end
  end
end
