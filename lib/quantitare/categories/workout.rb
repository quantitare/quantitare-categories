# frozen_string_literal: true

module Quantitare
  module Categories
    ##
    # A representation of a workout logged by a user.
    #
    class Workout < Quantitare::Category
      TYPES = [
        T_WALK = 'walk'
        T_RUN = 'run'
        T_HIKING = 'hiking'
        T_SKATING = 'skating'
        T_BMX = 'bmx'
        T_BICYCLING = 'bicycling'
        T_SWIMMING = 'swimming'
        T_SURFING = 'surfing'
        T_KITESURFING = 'kitesurfing'
        T_WINDSURFING = 'windsurfing'
        T_BODYBOARD = 'bodyboard'
        T_TENNIS = 'tennis'
        T_TABLE_TENNIS = 'table_tennis'
        T_SQUASH = 'squash'
        T_BADMINTON = 'badminton'
        T_LIFT_WEIGHTS = 'lift_weights'
        T_CALISTHENICS = 'calisthenics'
        T_ELLIPTICAL = 'elliptical'
        T_PILATES = 'pilates'
        T_BASKETBALL = 'basketball'
        T_SOCCER = 'soccer'
        T_FOOTBALL = 'football'
        T_RUGBY = 'rugby'
        T_VOLLEYBALL = 'volleyball'
        T_WATERPOLO = 'waterpolo'
        T_HORSE_RIDING = 'horse_riding'
        T_GOLF = 'golf'
        T_YOGA = 'yoga'
        T_DANCING = 'dancing'
        T_BOXING = 'boxing'
        T_FENCING = 'fencing'
        T_WRESTLING = 'wrestling'
        T_MARTIAL_ARTS = 'martial_arts'
        T_SKIING = 'skiing'
        T_SNOWBOARDING = 'snowboarding'
        T_ROWING = 'rowing'
        T_ZUMBA = 'zumba'
        T_BASEBALL = 'baseball'
        T_HANDBALL = 'handball'
        T_HOCKEY = 'hockey'
        T_ICE_HOCKEY = 'ice_hockey'
        T_CLIMBING = 'climbing'
        T_ICE_SKATING = 'ice_skating'
        T_MULTI_SPORT = 'multi_sport'
        T_INDOOR_RUNNING = 'indoor_running'
        T_OTHER = 'other'
      ].freeze

      specification do
        required(:type).filled(included_in?: TYPES)

        optional(:effective_duration).filled(:float) # Effective duration of the workout in seconds
        optional(:calories).filled(:float) # Active calories burned in kcal
        optional(:distance).filled(:float) # Distance travelled in meters, if applicable
        optional(:steps).filled(:integer) # Steps taken during the workout, if applicable
        optional(:floors_climbed).filled(:float) # Number of floors' worth of elevation climbed during the workout

        optional(:heart_rate_average).filled(:float) # Average heart rate in beats per minute
        optional(:heart_rate_max).filled(:float) # Maximum heart rate in beats per minute
        optional(:heart_rate_min).filled(:float) # Minimum heart rate in beats per minute

        optional(:supplementary_statistics).hash # Type-specific statistics go here, such as swim laps or strokes
        optional(:analysis).hash # Some sources provide values that add some additional analysis to the workout
      end
    end
  end
end
