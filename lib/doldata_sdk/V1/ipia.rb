module DolDataSDK
	module V1
		module Ipia
			def self.fetch(tablename, *args)
				Client.fetch("IPIA", tablename, args)
			end
		end
	end
end
