require 'spec_helper'

describe DolDataSDK::V1::Geography do
  let(:base_url){'api.dol.gov/V1/Geography'}

  context "#fetch" do
    it 'should make a request to the API to get its dataset' do
      expect(DolDataSDK::V1::Geography.fetch("City")).not_to be nil
      expect(WebMock).to have_requested(:get, Regexp.new(base_url + "/City")).once
    end
  end
end