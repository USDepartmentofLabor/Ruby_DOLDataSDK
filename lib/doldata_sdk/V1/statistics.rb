module DolDataSDK
		module V1
			module Statistics
			extend DolDataSDK::Utilities

				def self.agencies(*args)
					args.each do |name|
						instance_eval <<-DOLRUBY
            def #{name}(dataset,*arguments)
              Client.fetch("Statistics/#{capitalized_name(name)}",dataset,arguments)
            end
						DOLRUBY
					end
				end

				agencies 'oUI_initial_claims','pWSD','cEW','oES','cPS','cES','wIA','oES2010','bLS_Numbers','rEI'
			end
		end
	end