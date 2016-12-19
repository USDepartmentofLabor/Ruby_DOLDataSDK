module DolDataSDK
  module V1
    module Client #:nodoc:
      include HTTParty
      base_uri 'http://api.dol.gov/V1'
      def self.fetch(department, dataset, *args)
        get("/#{department}/#{dataset}?KEY=#{ENV['DOL_API_KEY']}&
                       #{args.join('&')}")
      end
    end
  end
end
