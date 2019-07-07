# frozen_string_literal: true

module Quantitare
  module Categories
    ##
    # Represents time spent using a computing device over the scrobble's span of time.
    #
    class DeviceActivity < Quantitare::Category
      DEVICE_TYPES = %w[computer phone tablet other].freeze

      specification do
        # The name of the activity; typically, the name of the application or website used.
        required(:name).filled(:string)

        # The type of device used, such as a computer, phone, or tablet.
        required(:device_type).filled(:string, included_in?: DEVICE_TYPES)
        # A name that can be used to uniquely identify the device used among the user's other devices. Since many time
        # tracking services do not provide this data, this field is optional.
        optional(:device_name).filled(:string)

        # The category under which this type of activity is filed.
        optional(:classification).filled(:string)

        # Since the start and end times for scrobbles like this might not be precise, the measure of time spent is
        # required. Note that because of this, there may be multiple overlapping scrobbles logged in the same span of
        # time. If the start and end times for the service used are granular down to the amount of time spent, then
        # seconds_spent would be equal to end_time - start_time.
        required(:seconds_spent).filled { int? | float? }

        # The rating of this activity, on a scale from 0 to 100. Some time tracking apps rate the "productivity" of an
        # application on some sort of scale. Like most other categories in Quantitare, this is to be normalized on a
        # scale from 0 to 100. This means that 50 is the "neutral" productivity rating, while the "unproductive" part
        # of the scale is below 50, and the "productive" part of the scale is above 50.
        optional(:rating).filled(:integer, gteq?: 0, lteq?: 100)
      end
    end
  end
end
