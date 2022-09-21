# frozen_string_literal: true

class FundraisingEventsController < ApplicationController
  def create
    response = Betterplace::FundraisingEvents.create(create_params)

    fundraising_event = response.as_json

    render json: { fundraising_event: }, status: :created
  end

  private

  def create_params
    params.require(:fundraising_event).permit(:name)
  end
end
