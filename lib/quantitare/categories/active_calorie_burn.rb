# frozen_string_literal: true

module Quantitare
  module Categories
    ##
    # A representation of a number of calories burned by the user while not at rest at a given time or span of time.
    #
    class ActiveCalorieBurn < Quantitare::Category
      specification do
        required(:kcal).filled(:float)
      end
    end
  end
end
