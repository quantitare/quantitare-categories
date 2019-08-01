# frozen_string_literal: true

module Quantitare
  module Categories
    ##
    # A commit created in a source control repository.
    #
    class CodeCommit < Quantitare::Category
      specification do
        required(:repository_name).filled(:string)
        optional(:sha).filled(:string)
        required(:message).maybe(:string)

        required(:author).hash do
          required(:name).filled(:string)
          required(:email).filled(:string)
        end

        required(:committer).hash do
          required(:name).filled(:string)
          required(:email).filled(:string)
        end

        required(:diff).hash do
          required(:files_changed).filled(:integer)
          required(:additions).filled(:integer)
          required(:deletions).filled(:integer)
        end
      end
    end
  end
end
