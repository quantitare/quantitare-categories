# frozen_string_literal: true

module Quantitare
  module Categories
    ##
    # A representation of an episode of television watched by a user. Contains basic information about the episode,
    # as well as a pointer with which Quantitare can gather more metadata about it.
    #
    class TV < Quantitare::Category
      specification do
        # The name of the source from which you wish to retrieve the episode's metadata, such as The TV DB
        # ("tvdb") or Trakt ("trakt"). The episode and show identifiers can be used to pull more data from that source
        # about the media.
        required(:service_source).maybe(:string)

        required(:episode_title).filled(:string)
        required(:episode_identifier).maybe(:string)

        required(:show_title).filled(:string)
        required(:show_identifier).maybe(:string)

        optional(:show_year).maybe(:integer)

        required(:season_number).maybe(:integer)
        required(:episode_number).maybe(:integer)
      end
    end
  end
end
