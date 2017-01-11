require 'spec_helper'

describe DolDataSDK::V1::Employment do
  let(:base_url){'api.dol.gov/V1/Employment'}

  context "#fetch" do
    it 'should make a request to the API to get its dataset' do
      expect(DolDataSDK::V1::Employment.fetch("MSHA_employmentProduction")).not_to be nil
      expect(WebMock).to have_requested(:get, Regexp.new(base_url + "/MSHA_employmentProduction")).once
    end
  end
end