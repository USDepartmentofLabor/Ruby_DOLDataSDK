require 'spec_helper'

describe DolDataSDK::V1::ApiMetrics do
  let(:base_url){'api.dol.gov/V1/ApiMetrics'}

  context "#fetch" do
    it 'should make a request to the API to get its dataset' do
      expect(DolDataSDK::V1::ApiMetrics.per_key("NumberOfRequestsPerKeys")).not_to be nil
      expect(WebMock).to have_requested(:get, Regexp.new(base_url + "/PerKey/NumberOfRequestsPerKeys")).once
    end
  end
end