module DolDataSDK
	module V1
		module DolAgency
			def self.fetch(tablename, *args)
				Client.fetch("DOLAgency", tablename, args)
			end
		end
	end
end

