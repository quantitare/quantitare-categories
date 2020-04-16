# frozen_string_literal: true

module Quantitare
  module Categories
    ##
    # A task completed by the user, generally fetched from a "Todo List" app, such as Todoist, Reminders, or Omnifocus.
    # Since all such apps use different terminology, values, and scales, the fields in this category are meant to
    # embody the most general concepts that are shared across most of the more popular apps. The descriptions given
    # to each field provide some guidance for how the app's constructs might be mapped onto this schema.
    #
    class TaskCompletion < Quantitare::Category
      specification do
        # The main text of the task
        required(:name).filled(:string)

        # The priority of the task, rated on a scale from 0 to 100. This may require that the app's priority convention
        # be mapped onto that of this category. For instance, a low-medium-high priority scale might map to 33, 66, and
        # 100, respectively.
        optional(:priority).value(:integer, gteq?: 0, lteq?: 100)

        # The list under which the task was filed. Some apps use the term "project" or "context" to describe this
        # concept.
        optional(:list).maybe(:string)

        # Additional notes appended to the task
        optional(:notes).maybe(:string)

        optional(:due_date).maybe(:date)

        optional(:tags).array(:string)
      end
    end
  end
end
