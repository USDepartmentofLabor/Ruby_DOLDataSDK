require 'spec_helper'

describe DolDataSDK::V1::Mining do
  include DolDataSDK::Utilities
  let(:base_url){'api.dol.gov/V1/Mining/'}

  context "#violation" do
    it 'should make a request to the API with Violation and its dataset' do
      expect(DolDataSDK::V1::Mining.violation("MSHA_violations")).not_to be nil
      expect(WebMock).to have_requested(:get, Regexp.new(base_url + "Violation/MSHA_violations")).once
    end
  end

  context "#full_mine_info" do
    it 'should make a request to the API with FullMineInfo and its dataset' do
      expect(DolDataSDK::V1::Mining.full_mine_info("MSHA_mines")).not_to be nil
      expect(WebMock).to have_requested(:get, Regexp.new(base_url + "FullMineInfo/MSHA_mines")).once
    end
  end
end