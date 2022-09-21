# frozen_string_literal: true

require 'rails_helper'

require 'debug'

RSpec.describe 'fundraising_events', type: :request do
  let(:valid_fundraising_event) do
    { fundraising_event: { name: 'Fundraising event name' } }
  end

  let(:invalid_fundraising_events) do
    {
      blank_name: { fundraising_event: { name: '' } },
      no_name: { fundraising_event: {} }
    }
  end

  describe 'POST /fundraising_events' do
    context 'when successful' do
      it 'responds with 201 and the new fundraising event data' do
        post '/fundraising_events', params: valid_fundraising_event

        response_data = JSON.parse(response.body)
        response_fundraising_event = response_data['fundraising_event']

        expect(response.status).to eq(201)
        expect(response_fundraising_event).not_to be_nil
        expect(response_fundraising_event['id']).to be_a(Integer).and(be > 0)
        expect(response_fundraising_event['name']).to eq 'Fundraising event name'
      end
    end
  end
end
