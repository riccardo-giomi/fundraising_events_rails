# frozen_string_literal: true

class FundraisingEventsController < ApplicationController
  def create
    response = Betterplace::FundraisingEvents.create(create_params)

    render json: { fundraising_event: response.as_json }, status: :created
  rescue Domain::ValidationError => e
    render json: { errors: e.errors }, status: :bad_request
  end

  private

  def create_params
    params.require(:fundraising_event).permit(:name)
  end
end
