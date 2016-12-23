require 'spec_helper'

describe DolDataSDK::V1::Client do
  let(:base_url){ 'api.dol.gov/V1/' }
  let(:department){ 'Safety/GulfOilSpill' }
  let(:dataset){ 'OSHA_Direct_Read_Sampling' }
  let(:api_key){ 'dummy_api_key' }

  context 'when making a request' do
    it 'has to set url with department and dataset' do
      expect(DolDataSDK::V1::Client.fetch(department, dataset)).not_to be nil
      expect(WebMock).to have_requested(:get,
          Regexp.new(base_url + "#{department}/#{dataset}")).once
    end
  end

  context 'API KEY' do
    before do
      ::ENV["DOL_API_KEY"] = api_key
    end
    it 'has to set url with API KEY from env' do
      expect(DolDataSDK::V1::Client.fetch(department, dataset)).not_to be nil
      expect(WebMock).to have_requested(:get,Regexp.new("KEY=#{api_key}")).once
    end
  end

end
