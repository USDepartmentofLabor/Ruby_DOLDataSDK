module DolDataSDK
	module V1
		module Faq
			def self.fetch(tablename, *args)
				Client.fetch("FAQ", tablename, args)
			end
		end
	end
end