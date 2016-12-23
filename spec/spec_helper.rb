$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'webmock/rspec'
require 'ruby_doldata_sdk'

WebMock.disable_net_connect!(allow_localhost: true)


RSpec.configure do |config|
	config.before(:each) do
		stub_request(:get, /.*api.dol.gov.*/).
				with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
				to_return(:status => 200, :body => '<xml></xml>', :headers => {})
	end
end
