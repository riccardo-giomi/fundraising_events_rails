# frozen_string_literal: true

require "#{Rails.root}/fundraising_events/domain.rb"

module Betterplace
  class FundraisingEvents < Domain::FundraisingEvents
    class << self
      def create(params)
        validate_params(params)
        request = Domain::FundraisingEvents::CreateRequest.new(**params)
        super(request)
      end

      def data_gateway
        Betterplace::DataGateways::FundraisingEvents
      end

      private

      def validate_params(params)
        raise ActiveModel::ForbiddenAttributes if params.respond_to?(:permitted?) && !params.permitted?
      end
    end
  end
end
