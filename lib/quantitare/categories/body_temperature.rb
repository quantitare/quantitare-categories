# frozen_string_literal: true

module Quantitare
  module Categories
    ##
    # A representation of a user's body temperature in degrees celsius at a given time or span of time.
    #
    class BodyTemperature < Quantitare::Category
      specification do
        required(:degrees_celsius).filled { float? | int? }
      end
    end
  end
end
