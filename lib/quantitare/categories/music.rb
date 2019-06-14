# frozen_string_literal: true

module Quantitare
  module Categories
    ##
    # A representation of a music track listen. Contains the basic information about the track, including artist,
    # album, and artwork, as well as some pointers with which Quantitare can gather more metadata about the track.
    #
    class Music < Quantitare::Category
      specification do
        # The name of the source from which you wish to retrieve the track's metadata, such as Musicbrainz
        # ("musicbrainz") or Last.fm ("lastfm"). The track, artist, and album can then point to the identifier
        # associated with that entity in that service. For example, if we use Musicbrainz as our data provider,
        # we sould use the service identifier "664c3e0e-42d8-48c1-b209-1efca19c0325" for the artist The National.
        required(:service_source).maybe(:string)

        required(:track).hash do
          required(:service_identifier).maybe(:string)

          required(:title).filled(:string)
          required(:duration).filled(:integer) # The duration of the track in milliseconds

          optional(:album_rank).value(:integer) # The ordering of the track in the album in which it appears
        end

        required(:artist).hash do
          required(:service_identifier).maybe(:string)

          required(:name).filled(:string)
        end

        optional(:album).hash do
          required(:service_identifier).maybe(:string)

          required(:service_identifier).maybe(:string)
          required(:title).filled(:string)

          optional(:release_date).filled(:date)

          # This is the 'album artist' -- typically, this is the same as the track's artist, but this field provides
          # flexibility in case those two values are different
          required(:artist).hash do
            required(:service_identifier).maybe(:string)

            required(:name).filled(:string)
          end
        end

        # The URL to the closest image for the track. This is ideally the album art for the album with which the track
        # is associated, but may be the artist's image instead
        optional(:image).hash do
          required(:small).maybe(:string)
          required(:medium).maybe(:string)
          required(:large).maybe(:string)
          required(:original).maybe(:string)
        end
      end
    end
  end
end
