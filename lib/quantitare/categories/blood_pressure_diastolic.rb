# frozen_string_literal: true

module Quantitare
  module Categories
    ##
    # A representation of a user's diastolic blood pressure in millimeters of mercury (mmHg) at a given time or span of
    # time.
    #
    class BloodPressureDiastolic < Quantitare::Category
      specification do
        required(:mmhg).filled(:float)
      end
    end
  end
end
