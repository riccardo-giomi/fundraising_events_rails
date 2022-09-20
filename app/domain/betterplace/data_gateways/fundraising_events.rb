# frozen_string_literal: true

require "#{Rails.root}/fundraising_events/domain/fundraising_events/data_gateways/fundraising_event"

module Betterplace
  module DataGateways
    class FundraisingEvents < Betterplace::FundraisingEvents::DataGateway
      class << self
        def create_fundraising_event(name:)
          FundraisingEvent.create(name:).attributes
        end

        private

        # Cheats to make testing easier
        def _count_fundraising_events
          FundraisingEvent.count
        end

        def _reset
          FundraisingEvent.destroy_all
        end
      end
    end
  end
end
