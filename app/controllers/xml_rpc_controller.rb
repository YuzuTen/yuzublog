# require 'xmlrpc/server'

# class XmlRpcController < ApplicationController
#   def initialize
#     @server=XMLRPC::BasicServer.new

#     self.class.instance_methods(false).each do |method|
#       logger.debug "Method: #{method} inspected."
#       unless['index'].member?(method)
#         @server.add_handler(method) do |*args|
#           self.send(method.to_sym, *args)
#         end
#       end
#     end
#   end

#   def index
#     logger.debug 'index called'
#     result=@server.process(request.body)
#     logger.debug "\n\nStart #{result} \n\n End\n"
#     render :text => result, :content_type => 'text/xml'
#   end
# end
