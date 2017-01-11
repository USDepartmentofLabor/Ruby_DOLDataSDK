module DolDataSDK
	module V1
		module ApiMetadata
			def self.fetch(*args)
				Client.fetch("APIMetadata/APIMetadata",args)
			end
		end
	end
end