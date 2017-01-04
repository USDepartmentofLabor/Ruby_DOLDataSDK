module DolDataSDK
	module V1
		module Mining
			extend DolDataSDK::Utilities

			def self.agencies(*args)
				args.each do |name|
					instance_eval <<-DOLRUBY
            def #{name}(dataset,*arguments)
              Client.fetch("Mining/#{capitalized_name(name)}",dataset,arguments)
            end
					DOLRUBY
				end
			end

			agencies 'violation','full_mine_info','basic_mine_info'
		end
	end
end