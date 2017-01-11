module DolDataSDK
	module V1
		module Statistics

			def self.oui_initial_claims(tablename, *args)
				Client.fetch("Statistics/OUI_InitialClaims", tablename, args)
			end

			def self.pwsd(tablename, *args)
				Client.fetch("Statistics/PWSD",tablename,args)
			end

			def self.cew(tablename, *args)
				Client.fetch("Statistics/CEW", tablename, args)
			end

			def self.oes(tablename, *args)
				Client.fetch("Statistics/OES", tablename, args)
			end

			def self.cps(tablename, *args)
				Client.fetch("Statistics/CPS", tablename, args)
			end

			def self.ces(tablename, *args)
				Client.fetch("Statistics/CES", tablename, args)
			end

			def self.cpi(tablename, *args)
				Client.fetch("Statistics/CPI", tablename, args)
			end

			def self.wia(tablename, *args)
				Client.fetch("Statistics/WIA", tablename, args)
			end

			def self.oes2010(tablename, *args)
				Client.fetch("Statistics/OES2010", tablename, args)
			end

			def self.bls_numbers(tablename, *args)
				Client.fetch("Statistics/BLS_Numbers", tablename, args)
			end

		end
	end
end
