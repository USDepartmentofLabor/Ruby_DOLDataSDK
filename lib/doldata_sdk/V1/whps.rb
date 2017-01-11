module DolDataSDK
	module V1
		module Whps
			def self.fetch(tablename, *args)
				Client.fetch("WHPS", tablename, args)
			end
		end
	end
end