# frozen_string_literal: true

class SocialNetworksController < ApplicationController
  def index
    @results = Fetcher.run

    render json: @results
  end
end
