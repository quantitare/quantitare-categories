# frozen_string_literal: true

module Quantitare
  module Categories
    ##
    # A representation of a user's systolic blood pressure in millimeters of mercury (mmHg) at a given time or span of
    # time.
    #
    class BloodPressureSystolic < Quantitare::Category
      specification do
        required(:mmhg).filled { float? | int? }
      end
    end
  end
end
