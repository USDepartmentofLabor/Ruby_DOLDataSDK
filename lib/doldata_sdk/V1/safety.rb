module DolDataSDK
  module V1
    module Safety
      extend DolDataSDK::Utilities

      def self.agencies(*args)
        args.each do |name|
          instance_eval <<-DOLRUBY
            def #{name}(tablename,*arguments)
              Client.fetch("Safety/#{capitalized_name(name)}",tablename,arguments)
            end
          DOLRUBY
        end
      end

      agencies 'injuries_and_illness','gulf_oil_spill','fatalities','employment','fatal_occupational_injuries','accidents' 
    end
  end
end