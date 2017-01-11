module DolDataSDK
	module V1
		module Compliance

			def self.whd(tablename, *args)
				Client.fetch("Compliance/WHD", tablename, args)
			end

			def self.osha(tablename, *args)
				Client.fetch("Compliance/OSHA", tablename, args)
			end

			def self.mine_inspection(tablename, *args)
				Client.fetch("Compliance/MineInspection", tablename, args)
			end

		end
	end
end