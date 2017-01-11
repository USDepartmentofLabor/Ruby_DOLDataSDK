module DolDataSDK
	module V1
		module AutoWorkers
			def self.fetch(tablename, *args)
				Client.fetch("AutoWorkers", tablename, args)
			end
		end
	end
end