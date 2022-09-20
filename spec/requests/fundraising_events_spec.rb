# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'fundraising_events', type: :request do
  describe 'POST /fundraising_events' do
    context 'when successful' do
      it 'returns the new fundraising event data' do
        post '/fundraising_events', params: { fundraising_event: { name: 'Fundraising event name' } }

        response_data = JSON.parse(response.body)

        expect(response.status).to eq(201)

        expect(response_data['id']).to be_a(Integer).and(be > 0)
        expect(response_data['name']).to eq 'Fundraising event name'
      end
    end
  end
end
