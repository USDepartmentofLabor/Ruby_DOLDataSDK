module DolDataSDK
	module V1
		module Employment
			def self.fetch(tablename, *args)
				Client.fetch("Employment", tablename, args)
			end
		end
	end
end