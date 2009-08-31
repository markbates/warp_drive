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


require 'configatron'
require 'genosaurus'

path = File.join(File.dirname(__FILE__), 'warp_drive')
require File.join(path, 'configure.rb')
require File.join(path, 'path.rb')