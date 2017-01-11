module DolDataSDK
	module V1
		module Geography
			def self.fetch(tablename, *args)
				Client.fetch("Geography", tablename, args)
			end
		end
	end
end