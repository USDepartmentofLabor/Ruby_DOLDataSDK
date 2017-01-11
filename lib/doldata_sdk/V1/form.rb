module DolDataSDK
	module V1
		module Form
			def self.fetch(tablename, *args)
				Client.fetch("IPIA", tablename, args)
			end
		end
	end
end