require 'spec_helper'

describe DolDataSDK::V1::Client do
	include DolDataSDK::Utilities
  let(:base_url){'api.dol.gov/V1/Safety/'}
  let(:method_and_datasets_map) do
    {
		    'injuries_and_illness' => 'II_CASE_TYPE',
        'gulf_oil_spill' => 'OSHA_Direct_Read_Sampling'
    }
  end

  before do
    stub_request(:get, /.*api.dol.gov.*/).
        with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => '<xml></xml>', :headers => {})
  end

  context "when making a request using HealthSafety wrapper" do
    it 'should make a request to the API with department and dataset' do
	    method_and_datasets_map.each do |method_name,dataset|
        expect(DolDataSDK::V1::HealthSafety.send(method_name,dataset)).not_to be nil
        expect(WebMock).to have_requested(:get, Regexp.new(base_url+"#{capitalized_name(method_name)}/#{dataset}")).once
	    end
    end
  end
end
