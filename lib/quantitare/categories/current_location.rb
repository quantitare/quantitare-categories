# frozen_string_literal: true

module Quantitare
  module Categories
    ##
    # While Quantitare provides a special scrobble type for location tracking known as +LocationScrobble+, it is often
    # the case that those scrobbles are not created in real-time. This is not ideal if the user wants to take advantage
    # of scrobblers and services that are augmented by location data. The +current_location+ category provides a more
    # flexible way to provide location data to Quantitare without using the +LocationScrobble+ interface, which requires
    # place and transit data.
    #
    class CurrentLocation < Quantitare::Category
      specification do
        required(:longitude).filled(:float)
        required(:latitude).filled(:float)

        # The user's altitude in meters
        optional(:altitude) { nil? | empty? | int? | float? }
        # The user's course over ground in degrees
        optional(:course) { nil? | empty? | int? | float? }
        # The user's velocity in km/h
        optional(:velocity) { nil? | empty? | int? | float? }

        # The horizontal and vertical accuracies of the location sample in meters
        optional(:horizontal_accuracy) { nil? | empty? | int? | float? }
        optional(:vertical_accuracy) { nil? | empty? | int? | float? }
      end
    end
  end
end
