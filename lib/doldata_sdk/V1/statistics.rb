module DolDataSDK
	module V1
		module Statistics
			extend DolDataSDK::Utilities

			def self.oui_initial_claims(dataset, *args)
				Client.fetch("Statistics/OUI_InitialClaims", dataset, args)
			end

			def self.pwsd(dataset, *args)
				Client.fetch("Statistics/PWSD",dataset,args)
			end

			def self.cew(dataset, *args)
				Client.fetch("Statistics/CEW", dataset, args)
			end

			def self.oes(dataset, *args)
				Client.fetch("Statistics/OES", dataset, args)
			end

			def self.cps(dataset, *args)
				Client.fetch("Statistics/CPS", dataset, args)
			end

			def self.ces(dataset, *args)
				Client.fetch("Statistics/CES", dataset, args)
			end

			def self.cpi(dataset, *args)
				Client.fetch("Statistics/CPI", dataset, args)
			end

			def self.wia(dataset, *args)
				Client.fetch("Statistics/WIA", dataset, args)
			end

			def self.oes2010(dataset, *args)
				Client.fetch("Statistics/OES2010", dataset, args)
			end

			def self.bls_numbers(dataset, *args)
				Client.fetch("Statistics/BLS_Numbers", dataset, args)
			end

		end
	end
end
