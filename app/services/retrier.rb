# frozen_string_literal: true

require 'httparty'

class Retrier
  MAX_ATTEMPTS = 3

  def self.run(url)
    attempts = 0

    begin
      attempts += 1

      response = HTTParty.get(url)
      responses = JSON.parse(response.body)

      responses.map { |r| r.values[1] }
    rescue JSON::ParserError
      if attempts <= MAX_ATTEMPTS
        retry
      else
       []
      end
    end
  end
end
