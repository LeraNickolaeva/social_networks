# frozen_string_literal: true

require 'rails_helper'

describe SocialNetworksController do
  describe '#index' do
    let(:result) { { 'twitter': ['tweets'], 'facebook': ['statuses'], 'instagram': ['photos'] } }

    subject { get :index }

    before do
      allow(Fetcher).to receive(:run).and_return(result)
    end

    it 'returns the result' do
      subject

      expect(assigns(:results)).to eq result
      expect(response).to be_successful
    end
  end
end
