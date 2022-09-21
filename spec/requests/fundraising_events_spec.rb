# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'fundraising_events', type: :request do
  let(:valid_fundraising_event) do
    { fundraising_event: { name: 'Fundraising event name' } }
  end

  let(:invalid_fundraising_events) do
    {
      with_blank_name: { fundraising_event: { name: '' } },
      with_no_name: { fundraising_event: {} }
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

    context 'with invalid data' do
      it 'responds with 400 and information on the errors' do
        post '/fundraising_events', params: invalid_fundraising_events[:with_blank_name]

        response_data   = JSON.parse(response.body)
        response_errors = response_data.dig('errors', 'fundraising_event')

        expect(response_errors).not_to be_nil
        expect(response_errors['name']).to match(/blank/)
        expect(response.status).to eq(400)
      end
    end
  end
end
