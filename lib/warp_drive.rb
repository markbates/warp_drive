class Hash # :nodoc:

  def recursive_merge!(other) # :nodoc:
    other.each do |key, value|
      myval = self[key]
      if value.is_a?(Hash) && myval.is_a?(Hash)
        myval.recursive_merge!(value)
      else
        self[key] = value
      end
    end
    self
  end # recursive_merge!

end # Hash

module Kernel # :nodoc:
  
  def run_once
    path = File.expand_path(caller.first)
    unless ($__already_run_block ||= []).include?(path)
      yield
      $__already_run_block << path
    end
  end
  
end


require 'configatron'
require 'genosaurus'

path = File.join(File.dirname(__FILE__), 'warp_drive')
require File.join(path, 'configure.rb')
require File.join(path, 'path.rb')