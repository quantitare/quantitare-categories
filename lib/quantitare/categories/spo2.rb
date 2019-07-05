# frozen_string_literal: true

module Quantitare
  module Categories
    ##
    # A representation of a user's SpO2 level in percentage at a given time or span of time.
    #
    class Spo2 < Quantitare::Category
      specification do
        required(:percent).filled { int? | float? }
      end
    end
  end
end
