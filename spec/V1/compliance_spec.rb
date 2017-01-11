require 'spec_helper'

describe DolDataSDK::V1::Compliance do
	let(:base_url){'api.dol.gov/V1/Compliance/'}

  context "#whd" do
    it 'should make a request to the API with WHD and its dataset' do
      expect(DolDataSDK::V1::Compliance.whd("full")).not_to be nil
      expect(WebMock).to have_requested(:get, Regexp.new(base_url + "WHD/full")).once
    end
  end

  context "#osha" do
    it 'should make a request to the API with OSHA and its dataset' do
      expect(DolDataSDK::V1::Compliance.osha("full")).not_to be nil
      expect(WebMock).to have_requested(:get, Regexp.new(base_url + "OSHA/full")).once
    end
  end

  context "#mine_inspection" do
    it 'should make a request to the API with mine_inspection and its dataset' do
      expect(DolDataSDK::V1::Compliance.mine_inspection("mineInspections")).not_to be nil
      expect(WebMock).to have_requested(:get, Regexp.new(base_url + "MineInspection/mineInspections")).once
    end
  end
end