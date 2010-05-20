require 'rubygems'
require 'test/unit'
require 'active_record'

begin
  require 'ruby-debug'
  Debugger.start
rescue LoadError
  # no ruby debugger
end

$:.unshift "#{File.dirname(__FILE__)}/../lib/"
require 'permalink_fu'
