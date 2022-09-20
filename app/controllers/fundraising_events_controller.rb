# frozen_string_literal: true

class FundraisingEventsController < ApplicationController
  def create
    response = Betterplace::FundraisingEvents.create(create_params)

    render json: response.to_json, status: :created
  end

  private

  def create_params
    params.require(:fundraising_event).permit(:name)
  end
end
