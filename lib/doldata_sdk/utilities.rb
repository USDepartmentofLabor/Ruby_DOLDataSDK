
module DolDataSDK
	module Utilities
		def capitalized_name(string)
			string.split('_').map{|e| e.capitalize }.join() unless string.nil?
		end
	end
end