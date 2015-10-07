Ruby_DOLDataSDK
===============

Ruby SDK to ease access to DOL's and other federal agencies' APIs. For a list of APIs that this SDK has been tested against, please see the wiki. For documentation, please see the readme. For sample code, please visit http://usdepartmentoflabor.github.io/Ruby-Sample-App/.

##Changelog


* v1.2.0 - Changed to a Nokogiri XML return type for DOL APIv1 as a workaround due to an issue where some of the JSON returned from the v1 APIs contain unescaped double-quotes. For instructions on how to use the Ruby Nokogiri XML object with this SDK, please refer to the updated [Ruby Sample App](http://usdepartmentoflabor.github.io/Ruby-Sample-App/)


* v1.1.0 Added Support for API v2 (Quarry)

To Use APIv2, for example, the [osha_accident dataset](http://developer.dol.gov/health-and-safety/dol-osha-enforcement/): 

```
API_HOST = 'http://data.dol.gov'
API_DATA = 'get'
API_URI = 'accident'
API_KEY = YOUR_KEY_HERE

context = GOV::DataContext.new API_HOST, API_KEY, API_DATA, API_URI
request = GOV::DataRequest.new context

request.call_api 'accident', :columns => '{report_id:event_date:event_desc}' do |results, error|
   results.each do |n|
   	puts "#{n['report_id']} - #{n['event_date']} - #{n['event_desc']}"
   end
end

```

* v1.0.1 Removed secret key to reflect dol api updates

* V1.0.0 Ruby SDK Initial Release