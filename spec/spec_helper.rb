$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'webmock/rspec'
require 'ruby_doldata_sdk'

WebMock.disable_net_connect!(allow_localhost: true)

