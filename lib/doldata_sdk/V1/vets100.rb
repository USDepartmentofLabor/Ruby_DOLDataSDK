module DolDataSDK
	module V1
		module Vets100
			def self.fetch(tablename, *args)
				Client.fetch("VETS100", tablename, args)
			end
		end
	end
end