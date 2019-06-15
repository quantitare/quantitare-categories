# frozen_string_literal: true

module Quantitare
  module Categories
    ##
    # A simple log with a single attribute: +content+.
    #
    class Log < Quantitare::Category
      specification do
        required(:content).maybe(:string)
      end
    end
  end
end
