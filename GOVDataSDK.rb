require 'rubygems'
require 'net/http'
require 'uri'
require 'thread'
require 'hmac-sha1'
require 'json'
require 'open-uri'
require 'net/https'
require 'openssl'

module GOV
  
   
    API_VALID_ARGUMENTS = %w[top skip select orderby filter]
    
    # This class handles storing the host, API key, and SharedSecret for your
    # DataRequest objects.  A DataContext is valid if it has values for host, key, and secret.
    class DataContext
        
        attr_accessor :host, :key, :secret, :login, :data, :uri
          
        def initialize host, key, secret, login, data,  uri
           @host, @key, @secret, @login, @data, @url = host, key, secret, login, data, uri
           
             
        end 
       
      
   end
    
    # This class handles requesting data using the API.
    # All DataRequest objects must be initialized with a DataContext
    # that provides the DatRequest with a host, API key and SharedSecret.
    # After generating a request, call #call_api to submit it.
    class DataRequest
        attr_accessor :context
        
        def initialize context
            @context = context
            @mutex = Mutex.new
            @active_requests = []
            
            
          
           
        end
        
        # This method consturcts and submits the data request.
        # It calls the passed block when it completes, returning both a result and an error.
        # If error is not nil, there was an error during processing.
        # The request is submitted in another thread, so call #wait_until_finished to ensure
        # that all requests have processed after submitting a request.
        # You can make multiple requests with #call_api from a single DataRequest object,
        # and #wait_until_finished wll correctly wait for all of them.
        
        
        def call_api method, arguments = {}, &block
            # Ensures only a valid DataContext is used
          
            unless @context.is_a? DataContext
                block.call nil, 'A context object was not provided.'
                return
            end
         
            
            # Ensures only valid arguments are used
            query = []
            arguments.each_pair do |key, value|
                if API_VALID_ARGUMENTS.member? key.to_s
                    query << "$#{key}=#{URI.escape value.to_s}"
                else
                   query << "#{key}=#{URI.escape value.to_s}"
                end
            end
            
            # Generates timestamp and url
            timestamp = GOV.timestamp
            
            url = URI.parse ["#{@context.host}/#{@context.url}/#{method}", query.join('&')].join '?'
                  
            # Creates a new thread, creates an authenticaed request, and requests data from the host
            @mutex.synchronize do
                @active_requests << Thread.new do
                    request = Net::HTTP::Get.new [url.path, url.query].join '?'
                    request.add_field 'Authorization', "Timestamp=#{timestamp}&ApiKey=#{@context.key}&Signature=#{signature timestamp, url}"
                    request.add_field 'Accept', 'application/json'
                    
                   
                    
                    result = Net::HTTP.start url.host, url.port do |http|
                        http.request request
                        
                        
                    end
                    
                   
                    
                    
                    if result.is_a? Net::HTTPSuccess
                      
                      #Cleanup jsonresult.
                      result = result.body.gsub(/\\+"/, '"')
                      result = result.gsub(/\\+n/, "")
                      result = result.gsub(/\"\"\{/, "{")
                      result = result.gsub(/}\"\"/, "}")

                      result = JSON.parse(result)['d']
                      
                      if (result.include?'results')
                          result = result['results'] if result.is_a? Hash
                      end

                      block.call result, nil
                      
                    else
                        block.call nil, "Error: #{result.message}"
                    end
                    
                    @mutex.synchronize do
                        @active_requests.delete Thread.current
                    end
                end
            end
        end
        
     def call_ext_api
            # Ensures only a valid DataContext is used
            unless @context.is_a? DataContext
                block.call nil, 'A context object was not provided.'
                return
            end
            
         
            # Generates timestamp and url
            
        if((!@context.host.empty?) && (!@context.key.empty?) && (@context.login.empty?) && (!@context.data.empty?))
          
             dataurl = "#{@context.host}#{@context.key}#{@context.data}"
             
             print " This is the data url call for the apikey and host call: #{dataurl}"
              
         end 
         
       if ((!@context.host.empty?) && (@context.key.empty?) && (@context.login.empty?))  
         
           if @context.data.empty? 
           
                 dataurl = "#{@context.host}"
                 
                  print " This is the data url call for the single host data call: #{dataurl}"
             
              
            else 
                
                 dataurl = "#{@context.host}#{@context.data}"
                 
                  print " This is the data url call for the host and data call: #{dataurl}"
                  
          
          end 
          
          
       end
       
       if ((!@context.host.empty?) && (!@context.key.empty?) && (!@context.login.empty?) && (!@context.data.empty?)) 
            
           dataurl = "#{@context.host}#{@context.login}#{@context.key}#{@context.data}"
          print " This is the data url call for the host, login, key  and data call: #{dataurl}"
        
       end 
       
     
unless dataurl.empty? 
          
      res = ""
           open("#{dataurl}", :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE).each_line   { |f| res += f 
            }  
           
         return res  
  
      end
 end    
     
        
        # Halts program until all ongoing requests sent by this DataRequest finish
        def wait_until_finished
            @active_requests.dup.each do |n|
                n.join
            end
        end
        
        private
        # Generates a signature using your SharedSecret and the request path
        def signature timestamp, url
            HMAC::SHA1.hexdigest @context.secret, [url.path, url.query + "&Timestamp=#{timestamp}&ApiKey=#{@context.key}"].join('?')
        end
    end
    
    module_function
    def timestamp
        Time.now.utc.strftime "%Y-%m-%dT%H:%M:%SZ"
    end
end


class String
    # converts date strings provided by the API (of the format /Date(milliseconds-since-Epoch)/) into Ruby Time objects
    def to_api_date
        if match(/\A\/Date\((\d+)\)\/\Z/)
            Time.at $1.to_i / 1000
        else
            raise TypeError, "Not a valid date format"
        end
    end
end