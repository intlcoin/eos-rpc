require "httparty"
Dir[File.dirname(__FILE__) + '/rpc/*.rb'].each do |file|
  require file
end
