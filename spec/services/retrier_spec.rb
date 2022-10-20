# frozen_string_literal: true

require 'rails_helper'
require 'webmock/rspec'

describe Retrier do
  let(:url)      { 'https://takehome.io/twitter' }
  let(:response) { instance_double(HTTParty::Response, body: response_body) }
  let(:headers)  { { 'Accept' => '*/*', 'User-Agent' => 'Ruby' } }

  subject(:service) { described_class.run(url) }

  context 'when successfull response' do
    let(:response_body) { '[{ "username": "user", "tweet": "tweet" }]' }
    let(:status)        { 200 }

    before do
      stub_request(:get, url).with(headers: headers).to_return(body: response_body, status: status)
    end

    it 'returns the result' do
      expect(subject).to eq(['tweet'])

      expect(WebMock).to have_requested(:get, url).at_least_once
    end
  end

  context 'when unsuccessfull response' do
    let(:status) { [500, 'Internal Server Error'] }

    before do
      stub_request(:get, url).with(headers: headers).to_return(status: status)
    end

    it 'returns the result' do
      expect(subject).to eq([])

      expect(WebMock).to have_requested(:get, url).at_least_once
    end
  end
end
