# frozen_string_literal: true

module Quantitare
  module Categories
    ##
    # A representation of a movie watched by a user. Contains basic information about the film, as well as a pointer
    # with which Quantitare can gather more metadata about it.
    #
    class Movie < Quantitare::Category
      specification do
        required(:service_source).maybe(:string)
        required(:service_identifier).maybe(:string)

        required(:title).filled(:string)
        required(:year).filled(:integer)
      end
    end
  end
end
