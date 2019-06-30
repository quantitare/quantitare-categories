# frozen_string_literal: true

module Quantitare
  module Categories
    ##
    # A representation of a number of steps taken by the user at a given time or span of time.
    #
    class Steps < Quantitare::Category
      specification do
        required(:count).filled(:integer)
      end
    end
  end
end
