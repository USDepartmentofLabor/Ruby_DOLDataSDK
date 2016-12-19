require 'spec_helper'

describe DolDataSDK::V1::Client do
  let(:base_url){'api.dol.gov/V1/'}
  let(:department){'Safety/GulfOilSpill'}
  let(:dataset){'OSHA_Direct_Read_Sampling'}
  let(:api_key){'dummy_api_key'}

  before do
    stub_request(:get, /.*api.dol.gov.*/).
      with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => '<xml></xml>', :headers => {})
  end

  context "when making a request" do
    it 'has to set url with department and dataset' do
      expect(DolDataSDK::V1::Client.fetch(department, dataset)).not_to be nil
      expect(WebMock).to have_requested(:get,
          Regexp.new(base_url + "#{department}/#{dataset}")).once
    end
  end

  context "API KEY" do
    before do
      ::ENV["DOL_API_KEY"] = api_key
    end
    it 'has to set url with API KEY from env' do
      expect(DolDataSDK::V1::Client.fetch(department, dataset)).not_to be nil
      expect(WebMock).to have_requested(:get,Regexp.new("KEY=#{api_key}")).once
    end
  end
end
