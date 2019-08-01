# frozen_string_literal: true

module Quantitare
  module Categories
    ##
    # A share on social media.
    #
    class SocialShare < Quantitare::Category
      specification do
        required(:content).filled(:string)

        required(:type).filled(:string, included_in?: ['text', 'photo', 'video', 'animation'])
        required(:service).filled(:string)

        required(:urls).array(:string)

        required(:media).array(:hash) do
          required(:type).filled(:string, included_in?: ['photo', 'video', 'animation'])
          required(:src).filled(:string)
        end

        # A group of "social counters," such as favorites, replies, and reshares. The terms used here are general-case
        # terms meant to be adapted from many social media services. Example mappings for each counter type can be seen
        # in their respective descriptions.
        required(:counters).hash do
          # Twitter: favorites; Facebook: likes; Flickr: favorites
          optional(:favorites).filled(:integer)

          # Twitter: replies; Facebook: comments; Flickr: comments
          optional(:replies).filled(:integer)

          # Twitter: retweets; Facebook: N/A; Flickr: N/A
          optional(:reshares).filled(:integer)
        end

        required(:is_reshare).filled(:bool)
        optional(:reshare_info).hash do
          required(:resharee_username).filled(:string)
          optional(:resharee_display_name).filled(:string)
        end

        required(:is_reply).filled(:bool)
        optional(:reply_info).hash do
          required(:replyee_username).filled(:string)
          optional(:replyee_display_name).filled(:string)
        end

        optional(:location).hash do
          required(:longitude).maybe(:float)
          required(:latitude).maybe(:float)
        end
      end
    end
  end
end
