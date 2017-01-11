module DolDataSDK
	module V1
		module ApiMetrics
			def self.per_key(tablename, *args)
				Client.fetch("ApiMetrics/PerKey", tablename, args)
			end
		end
	end
end