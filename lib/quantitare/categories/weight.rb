# frozen_string_literal: true

module Quantitare
  module Categories
    ##
    # A representation of a user's body weight in kilograms at a given time or span of time.
    #
    class Weight < Quantitare::Category
      specification do
        required(:kg).filled(:float)
      end
    end
  end
end
