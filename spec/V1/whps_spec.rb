require 'spec_helper'

describe DolDataSDK::V1::Whps do
  let(:base_url){'api.dol.gov/V1/WHPS'}

  context "#fetch" do
    it 'should make a request to the API to get its dataset' do
      expect(DolDataSDK::V1::Whps.fetch("PublicationsView")).not_to be nil
      expect(WebMock).to have_requested(:get, Regexp.new(base_url + "/PublicationsView")).once
    end
  end
end