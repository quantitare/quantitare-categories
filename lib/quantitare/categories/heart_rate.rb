# frozen_string_literal: true

module Quantitare
  module Categories
    ##
    # A representation of a user's heart rate in beats per minute (bpm) at a given time or span of time.
    #
    class HeartRate < Quantitare::Category
      specification do
        required(:bpm).filled(:float)
      end
    end
  end
end
